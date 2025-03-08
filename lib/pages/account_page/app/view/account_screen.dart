import 'package:flutter/material.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
        backgroundColor: AppColors.lightTeal, // Customize with your color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://example.com/profile.jpg'), // Profile image URL
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                "John Doe", // Replace with actual user name
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Center(
              child: Text(
                "johndoe@example.com", // Replace with actual user email
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Account Settings Section
            const Text(
              "Account Settings",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Settings Options
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Edit Profile"),
                  onTap: () {
                    // Navigate to Edit Profile page or handle logic
                    print("Edit Profile clicked");
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text("Change Password"),
                  onTap: () {
                    // Navigate to Change Password page or handle logic
                    print("Change Password clicked");
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text("Notification Settings"),
                  onTap: () {
                    // Navigate to Notification Settings page or handle logic
                    print("Notification Settings clicked");
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Log Out"),
                  onTap: () {
                    // Handle log out logic (e.g., clear session, navigate to login)
                    print("Log Out clicked");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
