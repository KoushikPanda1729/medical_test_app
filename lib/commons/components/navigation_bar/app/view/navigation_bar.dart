import 'package:flutter/material.dart';
import 'package:medical_test_app/commons/components/buttons/app/floating_button__widget.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, Asha 👋",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Agra, Delhi",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                width: 195,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FloatingButton(
                      onPressed: () {},
                      iconPath: AppIcons.add,
                      backgroundColor: AppColors.white,
                      iconColor: AppColors.teal,
                      isDisabled: false,
                      buttonSize: 42,
                      iconSize: 18,
                    ),
                    FloatingButton(
                      onPressed: () {},
                      iconPath: AppIcons.search,
                      backgroundColor: AppColors.white,
                      iconColor: AppColors.teal,
                      isDisabled: false,
                      buttonSize: 42,
                      iconSize: 18,
                    ),
                    FloatingButton(
                      onPressed: () {},
                      iconPath: AppIcons.bell,
                      backgroundColor: AppColors.white,
                      iconColor: AppColors.teal,
                      isDisabled: false,
                      buttonSize: 42,
                      iconSize: 18,
                    ),
                    FloatingButton(
                      onPressed: () {},
                      iconPath: AppIcons.shoppingCart,
                      backgroundColor: AppColors.white,
                      iconColor: AppColors.teal,
                      isDisabled: false,
                      buttonSize: 42,
                      iconSize: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
