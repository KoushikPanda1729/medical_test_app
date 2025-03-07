import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/buttons/app/floating_button__widget.dart';
import 'package:medical_test_app/commons/components/buttons/app/solid_button_widget.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';
import 'package:medical_test_app/commons/constants/app_images.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<String> _onboardingImages = [
    AppImages.onboarding1,
    AppImages.onboarding2,
    AppImages.onboarding3,
    AppImages.onboarding4,
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var image in _onboardingImages) {
      precacheImage(AssetImage(image), context);
    }
  }

  void _nextPage() {
    if (_currentPage == _onboardingImages.length - 1) {
      context.push('/login');
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double buttonSize = constraints.maxWidth * 0.12;
          double iconSize = constraints.maxWidth * 0.05;
          double indicatorSize = constraints.maxWidth * 0.02;
          double horizontalMargin = constraints.maxWidth * 0.0636;
          double bottomMargin = constraints.maxHeight * 0.02;

          return Stack(
            children: [
              PageView.builder(
                controller: _controller,
                itemCount: _onboardingImages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.asset(
                    _onboardingImages[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  );
                },
              ),
              Positioned(
                bottom: bottomMargin,
                left: horizontalMargin,
                right: horizontalMargin,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingButton(
                      onPressed: _previousPage,
                      iconPath: AppIcons.angleSmallRight,
                      backgroundColor: _currentPage == 0
                          ? AppColors.lightTeal
                          : AppColors.teal,
                      iconColor: AppColors.white,
                      isRotated: true,
                      isDisabled: _currentPage == 0,
                      buttonSize: buttonSize,
                      iconSize: iconSize,
                    ),
                    PageIndicator(
                      totalPages: _onboardingImages.length,
                      currentPage: _currentPage,
                      size: indicatorSize,
                    ),
                    FloatingButton(
                      onPressed: _nextPage,
                      iconPath: AppIcons.angleSmallRight,
                      backgroundColor: AppColors.teal,
                      iconColor: AppColors.white,
                      isDisabled: false,
                      buttonSize: buttonSize,
                      iconSize: iconSize,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Page indicator (dots)
class PageIndicator extends StatelessWidget {
  final int totalPages;
  final int currentPage;
  final double size;

  const PageIndicator({
    super.key,
    required this.totalPages,
    required this.currentPage,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalPages,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? AppColors.teal : AppColors.unselect,
          ),
        ),
      ),
    );
  }
}
