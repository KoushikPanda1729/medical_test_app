import 'package:flutter/material.dart';
import 'package:medical_test_app/commons/components/navigation_bar/app/view/bottom_navigation_bar.dart';
import 'package:medical_test_app/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:medical_test_app/pages/home_page/app/view/widgets/body_parts_grid.dart';
import 'package:medical_test_app/pages/home_page/app/view/widgets/care_card_section.dart';
import 'package:medical_test_app/pages/home_page/app/view/widgets/category_scroll.dart';
import 'package:medical_test_app/pages/home_page/app/view/widgets/health_packages.dart';
import 'package:medical_test_app/pages/home_page/app/view/widgets/medical_services_flex.dart';
import 'package:medical_test_app/pages/home_page/app/view/widgets/promo_section.dart';
import 'package:medical_test_app/pages/home_page/app/view/widgets/sliding_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const NavBar(),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  SlidingBanner(),
                  SizedBox(height: 18),
                  MedicalServicesFlex(),
                  SizedBox(height: 21),
                  HealthPackages(),
                  SizedBox(height: 21),
                  CategoryScroll(),
                  SizedBox(height: 21),
                  PromoSection(),
                  SizedBox(height: 21),
                  BodyPartsGrid(),
                  SizedBox(height: 21),
                  CareCardSection(),
                  SizedBox(height: 21),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const BottomNavigationBarWidget(
              activeIndex: 0,
            ),
          ),
        ],
      ),
    );
  }
}
