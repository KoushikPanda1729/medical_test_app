import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';

class MedicalServicesCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap; // Added onTap function

  const MedicalServicesCard({
    super.key,
    required this.title,
    this.iconPath = AppIcons.heartBeat,
    this.onTap, // Accept onTap function
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger navigation when tapped
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 11),
        decoration: BoxDecoration(
          color: AppColors.lightTeal.withOpacity(0.4),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 80,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            SvgPicture.asset(
              iconPath,
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(
                AppColors.black.withOpacity(0.5),
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
