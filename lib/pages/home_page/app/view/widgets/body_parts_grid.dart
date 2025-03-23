import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/buttons/app/floating_button__widget.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';
import 'package:medical_test_app/commons/constants/app_images.dart';
import 'package:medical_test_app/commons/components/health_condition_card/app/view/health_condition_card.dart';

class BodyPartsGrid extends StatelessWidget {
  const BodyPartsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> categoryData = [
      {"icon": AppImages.diabetes, "text": "Heart"},
      {"icon": AppImages.diabetes, "text": "Kidney"},
      {"icon": AppImages.diabetes, "text": "Liver"},
      {"icon": AppImages.diabetes, "text": "Thyroid"},
      {"icon": AppImages.diabetes, "text": "Bladder"},
      {"icon": AppImages.diabetes, "text": "Bladder"},
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Choose Test By ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "Body Parts",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.teal,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Stack(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryData.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 9),
                    child: HealthCard(
                      icon: category["icon"]!,
                      text: category["text"]!,
                      onPress: () {
                        context.push("/test-body-part");
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            if (categoryData.length > 5)
              Positioned(
                right: 0,
                top: 10,
                child: FloatingButton(
                  onPressed: () {
                    // Scroll logic can be added if required
                  },
                  iconPath: AppIcons.angleSmallRight,
                  backgroundColor: AppColors.teal,
                  iconColor: AppColors.white,
                  isDisabled: false,
                  buttonSize: 42,
                  iconSize: 20,
                ),
              ),
          ]),
        ],
      ),
    );
  }
}
