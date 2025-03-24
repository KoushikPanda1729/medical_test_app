import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/buttons/app/floating_button__widget.dart';
import 'package:medical_test_app/commons/components/buttons/app/solid_button_widget.dart';
import 'package:medical_test_app/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:medical_test_app/commons/components/text_fields/app/views/dropdown_text_field.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';

class NeedHelpScreen extends StatelessWidget {
  const NeedHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavBar(
            leadingIcon: FloatingButton(
              onPressed: () {
                context.pop();
              },
              iconPath: AppIcons.angleSmallRight,
              backgroundColor: AppColors.white,
              iconColor: AppColors.black,
              isDisabled: false,
              buttonSize: 42,
              iconSize: 20,
              isRotated: true,
            ),
            trailingIcon: const SizedBox(),
          ),
          const SizedBox(height: 13),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const Text(
                  "Need Assistance? We're Here to Help!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 34),

                TextfieldDropdown<String>(
                  title: "Inquiry Type",
                  label: '',
                  hintText: 'Inquiry Type',
                  selectedItem: '',
                  items: const [
                    "Billing",
                    "Technical Issue",
                    "General Inquiry"
                  ],
                  onItemSelected: (accountType) {},
                  getDisplayText: (accountType) => accountType,
                ),
                const SizedBox(height: 12),
                // Issue Description TextField
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Describe Your Issue",
                    hintStyle: const TextStyle(
                      color: Color(0xFF727272),
                    ),
                    filled: true,
                    fillColor: Colors.white, // Background color
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        color: Color(0xFFD1EDEB), // Light teal border
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        color: Colors.teal, // Border color when focused
                        width: 1.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        color: Color(0xFFD1EDEB), // Default border
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                // Request a Callback Button
                SolidButtonWidget(
                  label: "Request a Callback",
                  onPressed: () {},
                  isCircle: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
