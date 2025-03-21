import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/buttons/app/floating_button__widget.dart';
import 'package:medical_test_app/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom Back Button and Header
          NavBar(
            leadingIcon: FloatingButton(
              onPressed: () => context.pop(),
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
          const SizedBox(height: 24),

          // Support Title
          const Center(
            child: Text(
              "Need Help?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Support Description
          Center(
            child: Text(
              "Our support team is available 24/7 to assist you.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          const SizedBox(height: 40),

          // Support Agent Profile
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue.shade100,
                  // Replace with actual asset
                ),
                const SizedBox(height: 12),
                const Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Customer Support",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // Call and Chat Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Add call functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.teal,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.call, color: Colors.white),
                  label: const Text(
                    "Call Support",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () {
                    // Add chat functionality
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.teal),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.chat, color: AppColors.teal),
                  label: const Text(
                    "Chat with Support",
                    style: TextStyle(fontSize: 16, color: AppColors.teal),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),

          // Help Center Link
          Center(
            child: TextButton(
              onPressed: () {
                // Navigate to Help Center
              },
              child: const Text(
                "Visit Help Center",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.teal,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
