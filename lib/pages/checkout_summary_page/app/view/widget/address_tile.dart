import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.teal, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address 1",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  "Q11M4+R89, Talaswar, Jharkhand 825311",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SvgPicture.asset(
                AppIcons.check,
                colorFilter: const ColorFilter.mode(
                  AppColors.teal,
                  BlendMode.srcIn,
                ),
                width: 18,
                height: 18,
              ),
              const SizedBox(height: 13),
              SvgPicture.asset(
                AppIcons.pencil,
                colorFilter: const ColorFilter.mode(
                  AppColors.teal,
                  BlendMode.srcIn,
                ),
                width: 18,
                height: 18,
              ),
            ],
          )
        ],
      ),
    );
  }
}
