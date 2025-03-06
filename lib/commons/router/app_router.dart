import 'package:go_router/go_router.dart';
import 'package:medical_test_app/pages/login_page/app/views/login_screen.dart';
import 'package:medical_test_app/pages/onboarding_page/app/views/onboarding_screen.dart';
import 'package:medical_test_app/pages/signup_page/app/views/signup_screen.dart';
import 'package:medical_test_app/pages/onboarding_page/app/views/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),
  ],
);
