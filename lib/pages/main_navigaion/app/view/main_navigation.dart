import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_test_app/commons/components/navigation_bar/app/view/bottom_navigation_bar.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/pages/account_page/app/view/account_screen.dart';
import 'package:medical_test_app/pages/call_page/app/view/call_screen.dart';
import 'package:medical_test_app/pages/home_page/app/view/home_screen.dart';
import 'package:medical_test_app/pages/main_navigaion/app/provider/main_navigation_provider.dart';
import 'package:medical_test_app/pages/need_help_page/app/view/need_help_screen.dart';
import 'package:medical_test_app/pages/track_page/app/view/track_order_widget.dart';

class MainNavigationScreen extends ConsumerWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationState = ref.watch(navigationProvider);
    final navigationViewModel = ref.read(navigationProvider.notifier);

    return PopScope(
      canPop: navigationViewModel.canPopPage(),
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (!didPop) {
          navigationViewModel.handleBackPress();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: navigationState.pageController,
                onPageChanged: (index) {
                  navigationViewModel.onPageChanged(index);
                },
                children: const [
                  HomeScreen(),
                  NeedHelpScreen(),
                  CallScreen(),
                  TrackOrderWidget(),
                  AccountScreen(),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: BottomNavigationBarWidget(
                activeIndex: navigationState.currentIndex,
                onItemTapped: (index) {
                  navigationViewModel.changePage(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
