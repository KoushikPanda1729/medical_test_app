import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const SearchBarWidget({
    super.key,
    this.hintText = 'Search Test',
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        child: TextField(
          style: const TextStyle(fontSize: 15),
          textAlignVertical: TextAlignVertical.center,
          onChanged: onChanged, // Calls the function when text changes
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.teal,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: "Mulish",
            ),
            border: InputBorder.none,
            suffixIcon: SizedBox(
              width: 16,
              height: 16,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  AppIcons.search,
                  colorFilter: const ColorFilter.mode(
                    AppColors.teal,
                    BlendMode.srcIn,
                  ),
                  width: 16,
                  height: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
