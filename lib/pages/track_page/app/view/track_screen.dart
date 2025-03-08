import 'package:flutter/material.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Track Medical Report"),
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
            const Text(
              "Your Medical Reports are listed below. You can track the status of each report.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // List of Medical Reports
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with your actual data length
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: Icon(Icons.report, color: AppColors.lightTeal),
                      title: Text("Report #${index + 1}"),
                      subtitle: Text("Status: In Progress"),
                      trailing: IconButton(
                        icon: const Icon(Icons.track_changes),
                        onPressed: () {
                          // Add your tracking logic here
                          print("Track Report #${index + 1}");
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
