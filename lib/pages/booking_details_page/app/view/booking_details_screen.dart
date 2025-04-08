import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/buttons/app/floating_button__widget.dart';
import 'package:medical_test_app/commons/components/buttons/app/solid_button_widget.dart';
import 'package:medical_test_app/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';
import 'package:medical_test_app/commons/constants/app_images.dart';
import 'package:medical_test_app/pages/booking_details_page/app/view/widgets/cartography_widget.dart';
import 'package:medical_test_app/pages/booking_details_page/app/view/widgets/feature_icon.dart';
import 'package:medical_test_app/pages/booking_details_page/app/view/widgets/profile_description.dart';
import 'package:medical_test_app/pages/booking_details_page/app/view/widgets/test_detail_card.dart';
import 'package:medical_test_app/pages/booking_details_page/app/view/widgets/test_feature_card.dart';

class BookingDetailsScreen extends StatelessWidget {
  final Map<String, dynamic>? testData;

  const BookingDetailsScreen({
    super.key,
    this.testData,
  });

  @override
  Widget build(BuildContext context) {
    // If no data is passed, use default values
    final data = testData ??
        {
          'title': 'Complete Blood Count (CBC)',
          'parameters': '29 Parameters',
          'price': 1399,
          'imagePath': AppImages.test1,
          'description':
              'The Complete Blood Count (CBC) test analyzes red blood cells, white blood cells, and platelets, providing vital insights into your health. It helps diagnose anemia, infections, leukemia, and clotting disorders.',
          'features': [
            'Total 29 Tests',
            'Overnight Fasting Required',
            'For All Genders',
            'Online Report within 1 Day',
            'Age Group: 5-99 years',
            'Sample Collected from Home',
          ],
          'tests': [
            'Haemoglobin (Hb)',
            'RBC Count',
            'PCV / Hematocrit',
            'MCV',
          ],
        };

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
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
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            spreadRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Use the passed data for the test detail card
                          TestDetailCard(
                            imagePath: data['imagePath'] ?? AppImages.test1,
                            title: data['title'] ?? 'Test Package',
                            subtitle: data['parameters'] ?? 'Parameters',
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          // Use the passed data for features and price
                          TestFeatureCard(
                            features: List<String>.from(data['features'] ?? []),
                            price: "₹${data['price']}",
                            onAddToCart: () {
                              context.push("/checkout", extra: data);
                            },
                            onBookNow: () {
                              context.push("/checkout", extra: data);
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Use passed description
                    ProfileDescription(
                      description: data['description'] ?? '',
                    ),
                    const SizedBox(height: 21),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FeatureIconCard(
                          text: "NABL, CAP, UKAS",
                          icon: AppImages.certifiedLogo,
                        ),
                        FeatureIconCard(
                          text: "NABL, CAP, UKAS",
                          icon: AppImages.agentsLogo,
                        ),
                        FeatureIconCard(
                          text: "Guaranteed Precision",
                          icon: AppImages.precisionLogo,
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    // Use passed tests
                    CartographySection(
                      tests: List<String>.from(data['tests'] ?? []),
                    ),
                    const SizedBox(height: 35),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(bottom: 21),
            child: Row(
              children: [
                Expanded(
                    child: SolidButtonWidget(
                  label: "Add to Cart",
                  onPressed: () {
                    context.push("/checkout", extra: data);
                  },
                  backgroundColor: AppColors.orange,
                  isCircle: true,
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: SolidButtonWidget(
                  label: "Book Now",
                  onPressed: () {
                    context.push("/checkout", extra: data);
                  },
                  backgroundColor: AppColors.teal,
                  isCircle: true,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
