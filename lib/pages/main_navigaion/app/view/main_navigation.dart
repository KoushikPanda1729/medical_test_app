import 'package:flutter/material.dart';
import 'package:medical_test_app/commons/components/navigation_bar/app/view/bottom_navigation_bar.dart';
import 'package:medical_test_app/pages/account_page/app/view/account_screen.dart';
import 'package:medical_test_app/pages/call_page/app/view/call_screen.dart';
import 'package:medical_test_app/pages/home_page/app/view/home_screen.dart';
import 'package:medical_test_app/pages/need_help_page/app/view/need_help_screen.dart';
import 'package:medical_test_app/pages/track_page/app/view/track_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // NavBar is removed from here
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: const [
                HomeScreen(),
                NeedHelpScreen(),
                CallScreen(),
                TrackScreen(),
                AccountScreen(),
              ],
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
            child: BottomNavigationBarWidget(
              activeIndex: _currentIndex,
              onItemTapped: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
