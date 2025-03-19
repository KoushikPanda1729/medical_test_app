import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';
import 'package:medical_test_app/commons/components/package_card/app/view/health_package_card.dart';

class HealthPackages extends StatelessWidget {
  const HealthPackages({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> healthPackages = [
      {
        "title": "Complete Blood Test",
        "icon": AppIcons.dna,
        "numberOfTests": 30,
        "amount": 3999.0,
      },
      {
        "title": "Advanced Health Check",
        "icon": AppIcons.dna,
        "numberOfTests": 40,
        "amount": 4999.0,
      },
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
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: "Health Packages",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.teal),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => context.push("/popular-health-package"),
                child: const Text(
                  "See All",
                  style: TextStyle(color: AppColors.teal),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: healthPackages.map((package) {
              return HealthPackageCard(
                title: package["title"],
                icon: package["icon"],
                numberOfTests: package["numberOfTests"],
                amount: package["amount"],
                onBookNow: () => context.push("/booking_details"),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
