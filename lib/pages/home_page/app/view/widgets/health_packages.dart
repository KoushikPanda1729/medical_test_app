import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';
import 'package:medical_test_app/commons/constants/app_images.dart';
import 'package:medical_test_app/commons/components/package_card/app/view/health_package_card.dart';

class HealthPackages extends StatelessWidget {
  const HealthPackages({super.key});

  @override
  Widget build(BuildContext context) {
    // Enhanced health packages with more details
    final List<Map<String, dynamic>> healthPackages = [
      {
        "title": "Complete Blood Test Package",
        "icon": AppIcons.dna,
        "numberOfTests": 30,
        "amount": 3999.0,
        "imagePath": AppImages.test1,
        "parameters": "30 Parameters",
        "description":
            "The Complete Blood Test Package offers a comprehensive analysis of your blood health, covering key indicators for various conditions. This package is designed to provide a holistic view of your health status, helping detect potential issues early.",
        "features": [
          "Comprehensive testing with 30 parameters",
          "Fasting required (8 hours)",
          "For all age groups",
          "Online report within 24 hours",
          "Sample collection from home",
          "Free doctor consultation"
        ],
        "tests": [
          "Complete Blood Count (CBC)",
          "Comprehensive Metabolic Panel",
          "Lipid Profile",
          "Liver Function Test",
          "Kidney Function Test",
          "Thyroid Profile",
          "HbA1c",
          "Vitamin D",
          "Vitamin B12",
          "Iron Profile"
        ]
      },
      {
        "title": "Executive Health Package",
        "icon": AppIcons.dna,
        "numberOfTests": 40,
        "amount": 4999.0,
        "imagePath": AppImages.mainBanner7,
        "parameters": "40 Parameters",
        "description":
            "The Executive Health Package is our premium offering, providing an extensive health assessment with 40 critical parameters. Ideal for busy professionals who want a thorough health evaluation without multiple visits.",
        "features": [
          "Premium testing with 40 parameters",
          "Fasting required (10 hours)",
          "For adults 25 years and above",
          "Priority processing with results in 18 hours",
          "Sample collection from home",
          "Detailed health report with risk analysis",
          "Follow-up consultation with specialist"
        ],
        "tests": [
          "Complete Blood Count (CBC)",
          "Comprehensive Metabolic Panel",
          "Lipid Profile",
          "Liver Function Test",
          "Kidney Function Test",
          "Thyroid Profile (Complete)",
          "HbA1c",
          "Vitamin Panel (D, B12, Folate)",
          "Iron Profile",
          "Cardiac Risk Markers",
          "Hormone Profile",
          "Tumor Markers Screening",
          "Allergy Screening"
        ]
      },
      {
        "title": "Women's Health Package",
        "icon": AppIcons.dna,
        "numberOfTests": 35,
        "amount": 3599.0,
        "imagePath": AppImages.mainBanner4,
        "parameters": "35 Parameters",
        "description":
            "The Women's Health Package is specially designed to address female-specific health concerns, covering hormonal balance, nutrient levels, and general wellness markers for women of all ages.",
        "features": [
          "Focused testing with 35 parameters",
          "Fasting required (8 hours)",
          "For women 18 years and above",
          "Online report within 24 hours",
          "Sample collection from home",
          "Women's health specialist consultation"
        ],
        "tests": [
          "Complete Blood Count (CBC)",
          "Comprehensive Metabolic Panel",
          "Lipid Profile",
          "Thyroid Profile (Complete)",
          "Female Hormone Panel",
          "Vitamin D & B12",
          "Iron Profile",
          "Calcium & Bone Health",
          "Breast Cancer Markers",
          "Anemia Profile",
          "Diabetes Screening"
        ]
      },
      {
        "title": "Senior Citizen Package",
        "icon": AppIcons.dna,
        "numberOfTests": 45,
        "amount": 4299.0,
        "imagePath": AppImages.mainBanner7,
        "parameters": "45 Parameters",
        "description":
            "The Senior Citizen Package is tailored for adults over 60, focusing on age-related health concerns and providing a comprehensive assessment of all major body systems.",
        "features": [
          "Complete testing with 45 parameters",
          "Fasting required (8 hours)",
          "For adults 60 years and above",
          "Online report within 24 hours",
          "Home sample collection with priority timing",
          "Geriatric specialist consultation",
          "Detailed health recommendations"
        ],
        "tests": [
          "Complete Blood Count (CBC)",
          "Comprehensive Metabolic Panel",
          "Lipid Profile",
          "Liver Function Test",
          "Kidney Function Test",
          "Thyroid Profile",
          "HbA1c",
          "Vitamin D & B12",
          "Bone Health Panel",
          "Cardiac Risk Markers",
          "Prostate/Gynecological Screening",
          "Arthritis Profile",
          "Vision & Hearing Assessment"
        ]
      }
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        fontFamily: 'Mulish',
                      ),
                    ),
                    TextSpan(
                      text: "Health Packages",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.teal,
                        fontFamily: 'Mulish',
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => context.push("/popular-health-package"),
                child: const Text(
                  "See All",
                  style: TextStyle(
                    color: AppColors.teal,
                    fontFamily: 'Mulish',
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: healthPackages.map((package) {
                return Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: HealthPackageCard(
                    title: package["title"],
                    icon: package["icon"],
                    numberOfTests: package["numberOfTests"],
                    amount: package["amount"],
                    onBookNow: () {
                      // Prepare data for booking details
                      final bookingData = {
                        'title': package["title"],
                        'parameters': "${package["numberOfTests"]} Parameters",
                        'price': package["amount"],
                        'imagePath': package["imagePath"],
                        'description': package["description"],
                        'features': package["features"],
                        'tests': package["tests"],
                      };

                      // Pass the data to booking details page
                      context.push("/booking_details", extra: bookingData);
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
