import 'package:flutter/material.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';

class HealthCard extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onPress;

  const HealthCard({
    super.key,
    required this.icon,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 61,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.lightTeal, width: 1),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 30,
              height: 30,
            ),
            const SizedBox(height: 5),
            // Text with overflow and max width
            Text(
              text,
              style: const TextStyle(
                fontSize: 10,
                height: 1,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis, // Truncates text with '...'
              maxLines: 1, // Ensures text stays on one line
              softWrap: false, // Prevents text from wrapping
            ),
          ],
        ),
      ),
    );
  }
}
