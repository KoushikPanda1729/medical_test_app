import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int activeIndex;
  final Function(int)? onItemTapped;

  const BottomNavigationBarWidget({
    super.key,
    this.activeIndex = 0,
    this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      color: AppColors.teal,
      animationDuration: const Duration(milliseconds: 200),
      height: 75.0,
      index: activeIndex,
      onTap: (index) {
        if (onItemTapped != null) {
          onItemTapped!(index);
        }
      },
      items: [
        _buildNavItem(AppIcons.homeButton),
        _buildNavItem(AppIcons.needHelpButton),
        _buildNavItem(AppIcons.callButton),
        _buildNavItem(AppIcons.trackButton),
        _buildNavItem(AppIcons.userButton),
      ],
    );
  }

  Widget _buildNavItem(String icon) {
    return SvgPicture.asset(
      icon,
      height: 25,
      width: 25,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
  }
}
