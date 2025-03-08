import 'package:flutter/material.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Call Support"),
        backgroundColor: AppColors.lightTeal, // You can customize the color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Tap the button below to call our support team.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
            // Call Button
            ElevatedButton(
              onPressed: () {
                // Here you can add functionality to initiate the call
                print("Call support clicked");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.green, // Green color for the call button
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Call Now",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Alternatively, you could add an icon for calling
            IconButton(
              icon: const Icon(Icons.phone),
              onPressed: () {
                // Add functionality to place a call
                print("Phone icon clicked");
              },
              iconSize: 60,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
