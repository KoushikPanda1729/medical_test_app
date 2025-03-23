import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SlidingBanner extends StatefulWidget {
  const SlidingBanner({super.key});

  @override
  State<SlidingBanner> createState() => _SlidingBannerState();
}

class _SlidingBannerState extends State<SlidingBanner> {
  final PageController pageController = PageController();
  final List<String> banners = [
    AppImages.mainBanner,
    AppImages.mainBanner,
    AppImages.mainBanner,
    AppImages.mainBanner,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 256,
          width: double.infinity,
          child: PageView.builder(
            controller: pageController,
            itemCount: banners.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push('/booking_details');
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      banners[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        SmoothPageIndicator(
          controller: pageController,
          count: banners.length,
          effect: ExpandingDotsEffect(
            dotWidth: 8,
            dotHeight: 8,
            activeDotColor: AppColors.teal,
            dotColor: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }
}
