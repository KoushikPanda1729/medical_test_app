// import 'package:go_router/go_router.dart';
// import 'package:medical_test_app/pages/home_page/app/view/home_screen.dart';
// import 'package:medical_test_app/pages/login_page/app/views/login_screen.dart';
// import 'package:medical_test_app/pages/onboarding_page/app/views/onboarding_screen.dart';
// import 'package:medical_test_app/pages/signup_page/app/views/signup_screen.dart';
// import 'package:medical_test_app/pages/onboarding_page/app/views/splash_screen.dart';

// final GoRouter router = GoRouter(
//   initialLocation: '/splash',
//   routes: [
//     GoRoute(
//       path: '/',
//       name: "home",
//       builder: (context, state) => const HomeScreen(),
//     ),
//     GoRoute(
//       path: '/splash',
//       builder: (context, state) => const SplashScreen(),
//     ),
//     GoRoute(
//       path: '/onboarding',
//       builder: (context, state) => const OnboardingScreen(),
//     ),
//     GoRoute(
//       path: '/login',
//       builder: (context, state) => const LoginScreen(),
//     ),
//     GoRoute(
//       path: '/signup',
//       builder: (context, state) => const SignupScreen(),
//     ),
//   ],
// );

import 'package:go_router/go_router.dart';
import 'package:medical_test_app/pages/account_page/app/view/account_screen.dart';
import 'package:medical_test_app/pages/call_page/app/view/call_screen.dart';
import 'package:medical_test_app/pages/home_page/app/view/home_screen.dart';
import 'package:medical_test_app/pages/login_page/app/views/login_screen.dart';
import 'package:medical_test_app/pages/main_navigaion/app/view/main_navigation.dart';
import 'package:medical_test_app/pages/need_help_page/app/view/need_help_screen.dart';
import 'package:medical_test_app/pages/onboarding_page/app/views/onboarding_screen.dart';
import 'package:medical_test_app/pages/signup_page/app/views/signup_screen.dart';
import 'package:medical_test_app/pages/onboarding_page/app/views/splash_screen.dart';
import 'package:medical_test_app/pages/track_page/app/view/track_screen.dart';
// Import new screen files
// import 'package:medical_test_app/pages/help_page/app/views/help_screen.dart';
// import 'package:medical_test_app/pages/call_page/app/views/call_screen.dart';
// import 'package:medical_test_app/pages/track_page/app/views/track_screen.dart';
// import 'package:medical_test_app/pages/account_page/app/views/account_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    // Main navigation routes
    GoRoute(
      path: '/',
      name: "home",
      builder: (context, state) => const MainNavigationScreen(),
    ),

    GoRoute(
      path: '/help',
      name: "help",
      builder: (context, state) => const NeedHelpScreen(),
    ),
    GoRoute(
      path: '/call',
      name: "call",
      builder: (context, state) => const CallScreen(),
    ),
    GoRoute(
      path: '/track',
      name: "track",
      builder: (context, state) => const TrackScreen(),
    ),
    GoRoute(
      path: '/account',
      name: "account",
      builder: (context, state) => const AccountScreen(),
    ),

    // Other routes
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
