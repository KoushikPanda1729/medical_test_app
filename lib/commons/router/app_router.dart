import 'package:go_router/go_router.dart';
import 'package:medical_test_app/pages/account_page/app/view/account_screen.dart';
import 'package:medical_test_app/pages/booking_details_page/app/view/booking_details_screen.dart';
import 'package:medical_test_app/pages/call_page/app/view/call_screen.dart';
import 'package:medical_test_app/pages/checkout_page/app/view/checkout_summary.dart';
import 'package:medical_test_app/pages/checkout_page/app/view/make_payment.dart';
import 'package:medical_test_app/pages/checkout_page/app/view/payment_successfull_screen.dart';
import 'package:medical_test_app/pages/checkout_page/app/view/select_member_page.dart';
import 'package:medical_test_app/pages/checkout_page/app/view/select_schedule_test.dart';
import 'package:medical_test_app/pages/login_page/app/views/login_screen.dart';
import 'package:medical_test_app/pages/main_navigaion/app/view/main_navigation.dart';
import 'package:medical_test_app/pages/need_help_page/app/view/need_help_screen.dart';
import 'package:medical_test_app/pages/onboarding_page/app/views/onboarding_screen.dart';
import 'package:medical_test_app/pages/signup_page/app/views/signup_screen.dart';
import 'package:medical_test_app/pages/onboarding_page/app/views/splash_screen.dart';
import 'package:medical_test_app/pages/track_page/app/view/track_screen.dart';

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
      path: '/booking_details',
      name: "booking_details",
      builder: (context, state) => const BookingDetailsScreen(),
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
    GoRoute(
      path: '/checkout_summary',
      builder: (context, state) => const CheckoutSummary(),
    ),
    GoRoute(
      path: '/add_member',
      builder: (context, state) => SelectMemberScreen(),
    ),
    GoRoute(
      path: '/add_schedule',
      builder: (context, state) => SelectDateTimeAddressScreen(),
    ),
    GoRoute(
      path: '/make_payment',
      builder: (context, state) => MakePayment(),
    ),
    GoRoute(
      path: '/payment_success',
      builder: (context, state) => const PaymentSuccessfulScreen(),
    ),
  ],
);
