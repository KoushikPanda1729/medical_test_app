import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';
import 'package:medical_test_app/commons/constants/app_images.dart';
import 'package:medical_test_app/pages/home_page/app/provider/sliding_banner_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SlidingBanner extends ConsumerWidget {
  const SlidingBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bannerState = ref.watch(slidingBannerProvider);

    // Enhanced health packages with more details
    final List<Map<String, dynamic>> healthPackages = [
      {
        "title": "Complete Blood Test Package",
        "icon": AppIcons.dna,
        "numberOfTests": 30,
        "price": 3999.0,
        "imagePath": AppImages.mainBanner1,
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
        "price": 4999.0,
        "imagePath": AppImages.mainBanner2,
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
        "title": "Executive Health Package",
        "icon": AppIcons.dna,
        "numberOfTests": 40,
        "price": 4999.0,
        "imagePath": AppImages.mainBanner5,
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
        "price": 3599.0,
        "imagePath": AppImages.mainBanner6,
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
        "price": 4299.0,
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

    return Column(
      children: [
        SizedBox(
          height: 256,
          width: double.infinity,
          child: PageView.builder(
            controller: bannerState.pageController,
            itemCount: bannerState.banners.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push('/booking_details', extra: healthPackages[index]);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      bannerState.banners[index],
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        SmoothPageIndicator(
          controller: bannerState.pageController,
          count: bannerState.banners.length,
          effect: ExpandingDotsEffect(
            dotWidth: 8,
            dotHeight: 8,
            activeDotColor: AppColors.teal,
            dotColor: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }
}
