import 'package:flutter/material.dart';
import 'package:medical_test_app/commons/constants/app_images.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/components/health_condition_card/app/view/health_condition_card.dart';

class CategoryScroll extends StatelessWidget {
  const CategoryScroll({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> categoryData = [
      {"icon": AppImages.diabetes, "text": "Diabetes"},
      {"icon": AppImages.diabetes, "text": "Heart Disease"},
      {"icon": AppImages.diabetes, "text": "Cancer"},
      {"icon": AppImages.diabetes, "text": "Kidney Disease"},
      {"icon": AppImages.diabetes, "text": "Lung Disease"},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Popular ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "Health Packages",
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 16,
              children: categoryData.map((category) {
                return HealthCard(
                  icon: category["icon"]!,
                  text: category["text"]!,
                  onPress: () {
                    print("${category['text']} card clicked!");
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
