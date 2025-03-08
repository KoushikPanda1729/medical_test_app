import 'package:flutter/material.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';
import 'package:medical_test_app/commons/components/test_package_card/app/view/test_package_card.dart';

class HealthPackages extends StatelessWidget {
  const HealthPackages({super.key});

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TestPackageCard(
                  title: 'Complete Blood Test',
                  icon: AppIcons.dna,
                  numberOfTests: 30,
                  amount: 3999,
                  onBookNow: () {}),
              TestPackageCard(
                  title: 'Advanced Health Check',
                  icon: AppIcons.dna,
                  numberOfTests: 40,
                  amount: 4999,
                  onBookNow: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
