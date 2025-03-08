import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int activeIndex; // Track active index

  const BottomNavigationBarWidget({super.key, this.activeIndex = -1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavItem(AppIcons.homeButton, "Home", activeIndex == 0),
          _buildNavItem(AppIcons.needHelpButton, "Need Help", activeIndex == 1),
          _buildNavItem(AppIcons.callButton, "Call", activeIndex == 2),
          _buildNavItem(AppIcons.trackButton, "Track", activeIndex == 3),
          _buildNavItem(AppIcons.userButton, "Account", activeIndex == 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(String icon, String label, bool isActive) {
    return Column(
      children: [
        SvgPicture.asset(
          icon,
          height: 25,
          width: 25,
          colorFilter: isActive
              ? const ColorFilter.mode(AppColors.teal, BlendMode.srcIn)
              : ColorFilter.mode(
                  AppColors.black.withOpacity(0.4), BlendMode.srcIn),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? AppColors.teal : AppColors.black.withOpacity(0.4),
            fontSize: 10,
            height: 1,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
