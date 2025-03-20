import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';

class TimePickerWidget extends StatelessWidget {
  const TimePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select time",
          style:
              TextStyle(fontSize: 16, height: 1, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "12:30",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: AppColors.teal,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SvgPicture.asset(
                  AppIcons.clock,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                  width: 15,
                  height: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
