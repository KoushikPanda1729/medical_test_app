import 'package:flutter/material.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';

class CartographySection extends StatelessWidget {
  final List<String> tests;

  const CartographySection({super.key, required this.tests});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.teal.withOpacity(0.4)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: "Test(s) "),
                    TextSpan(
                      text: "Included",
                      style: TextStyle(color: Colors.teal), // Teal color
                    ),
                  ],
                ),
              ),
              Text(
                "(${tests.length})",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal, // Teal color
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // List of Tests
          Column(
            children: tests.map((test) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      test,
                      style: const TextStyle(fontSize: 14),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.teal,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  if (test != tests.last)
                    const Divider(
                      height: 1,
                      color: AppColors.unselect,
                    ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
