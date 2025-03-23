import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_test_app/pages/onboarding_page/app/viewmodels/onboarding_state.dart';
import 'package:medical_test_app/pages/onboarding_page/app/viewmodels/onboarding_viewmodel.dart';

final onboardingProvider =
    StateNotifierProvider<OnboardingViewModel, OnboardingState>(
  (ref) => OnboardingViewModel(),
);
