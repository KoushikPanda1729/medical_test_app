import 'package:flutter/material.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  final String imagePath;
  final double size;
  final VoidCallback onTap;

  const ProfileAvatar({
    super.key,
    required this.imagePath,
    this.size = 64, // Default size
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.teal, width: 2),
            ),
            child: CircleAvatar(
              radius: size / 2,
              backgroundColor: Colors.grey[300],
              backgroundImage: AssetImage(imagePath),
            ),
          ),
        ),
        Positioned(
          right: 2,
          bottom: 2,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.teal,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Icon(
              Icons.edit,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
