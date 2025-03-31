import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_test_app/commons/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:medical_test_app/pages/home_page/app/viewmodel/sliding_banner_state.dart';

class SlidingBannerViewModel extends StateNotifier<SlidingBannerState> {
  SlidingBannerViewModel()
      : super(
          SlidingBannerState(
            pageController: PageController(),
            banners: [
              AppImages.mainBanner1,
              AppImages.mainBanner2,
              AppImages.mainBanner3,
              AppImages.mainBanner4,
            ],
          ),
        );

  void goToPage(int page) {
    state.pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
