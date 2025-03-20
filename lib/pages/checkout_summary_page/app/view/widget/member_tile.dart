import 'package:flutter/material.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';

class MemberTile extends StatelessWidget {
  final String name;
  final String gender;
  final String age;
  final bool isSelected;
  final VoidCallback onTap;

  const MemberTile({
    super.key,
    required this.name,
    required this.gender,
    required this.age,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? AppColors.teal : AppColors.lightTeal,
              width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Colors.teal.withOpacity(0.1) : Colors.white,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, color: Colors.teal),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "$gender, $age Yrs.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Colors.teal,
              ),
          ],
        ),
      ),
    );
  }
}
