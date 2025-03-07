import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/buttons/app/solid_button_widget.dart';
import 'package:medical_test_app/commons/components/text_fields/app/views/dropdown_text_field.dart';
import 'package:medical_test_app/commons/components/text_fields/app/views/numeric_text_field_widget.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_images.dart';
import 'package:medical_test_app/commons/router/app_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final padding = mediaQuery.padding;

    // Safe area calculation
    final safeHeight = screenHeight - padding.top - padding.bottom;

    // Responsive breakpoints
    final isTablet = screenWidth > 600;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: IntrinsicHeight(
              child: Column(
                children: [
                  // Background healthcare team image with teal overlay at the top
                  Container(
                    height: safeHeight * 0.35,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.7),
                    ),
                    child: Stack(
                      children: [
                        // Image with appropriate fit
                        Positioned.fill(
                          child: Image.asset(
                            AppImages.loginScreenImage,
                            fit: BoxFit.cover, // Changed from cover to contain
                            alignment: Alignment.center,
                          ),
                        ),
                        // Teal overlay
                        Positioned.fill(
                          child: Container(
                            color: Colors.teal.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Login container
                  Expanded(
                    child: Transform.translate(
                      offset: const Offset(0, -35),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: isTablet ? 32.0 : 24.0,
                            vertical: 24.0,
                          ),
                          child: _buildLoginForm(context, isTablet),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Extracted the form into a separate method for better organization
  Widget _buildLoginForm(BuildContext context, bool isTablet) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Login Or Sign Up text
              Text(
                'Login Or Sign Up',
                style: textTheme.titleLarge?.copyWith(
                  color: Colors.teal,
                  fontSize: isTablet ? 22 : 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),

              // Phone input field with country code
              _buildPhoneInput(context, isTablet),
              const SizedBox(height: 37),

              // Continue button
              SolidButtonWidget(
                label: 'Continue',
                onPressed: () {
                  context.push("/");
                },
              ),

              // Or sign up with divider
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'or sign up with',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade600,
                          fontSize: isTablet ? 16 : 14,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                  ],
                ),
              ),

              // Sign up button
              SolidButtonWidget(
                label: 'Sign Up',
                onPressed: () {
                  context.push("/signup");
                },
              ),
            ],
          ),
        ),

        // Spacer to push Terms of Service to the bottom
        const Spacer(),

        // Terms of service text
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text.rich(
            TextSpan(
              text: 'By proceeding, you agree with our ',
              style: textTheme.bodySmall?.copyWith(
                color: Colors.grey.shade600,
                fontSize: isTablet ? 14 : 13,
              ),
              children: [
                TextSpan(
                  text: 'Terms of Services',
                  style: textTheme.bodySmall?.copyWith(
                    color: AppColors.teal, // Red color for Terms of Services
                    fontSize: isTablet ? 14 : 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' & ',
                  style: textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                    fontSize: isTablet ? 14 : 13,
                  ),
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: textTheme.bodySmall?.copyWith(
                    color: AppColors.teal, // Red color for Privacy Policy
                    fontSize: isTablet ? 14 : 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  // Extracted phone input widget for reusability
  Widget _buildPhoneInput(BuildContext context, bool isTablet) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: Colors.black, width: 0.10), // Bottom border only
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Country flag and code
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Image.asset(
                  AppImages.flag,
                  width: isTablet ? 28 : 24,
                  height: isTablet ? 28 : 24,
                ),
                const SizedBox(width: 4),
                SizedBox(
                  width: 60,
                  child: TextfieldDropdown<String>(
                    isCircularBorder: true,
                    borderNone: true,
                    title: "Select Country Code",
                    label: '',
                    hintText: '',
                    selectedItem: '+91',
                    items: const [
                      '+1', // USA
                      '+44', // UK
                      '+91', // India
                      '+81', // Japan
                      '+33', // France
                      '+49', // Germany
                      '+61', // Australia
                      '+55', // Brazil
                      '+86', // China
                      '+39', // Italy
                      '+33', // France
                      '+49', // Germany
                      '+61', // Australia
                      '+55', // Brazil
                      '+86', // China
                      '+39', // Italy
                    ],
                    onItemSelected: (code) {},
                    getDisplayText: (code) => code,
                  ),
                ),
              ],
            ),
          ),
          // Vertical divider
          Container(
            height: 24,
            width: 0.10,
            color: Colors.black,
          ),

          Expanded(
            child: NumericTextfieldWidget(
              onTextChanged: (value) {},
              hintText: '98765 43210',
              borderNone: true,
            ),
          )
        ],
      ),
    );
  }
}
