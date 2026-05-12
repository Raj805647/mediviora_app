import 'package:mediviora_app/features/auth/onboarding/onboarding_screen.dart';
import 'package:mediviora_app/features/screens/ai/ai_screen.dart';
import 'package:mediviora_app/features/screens/book_appointment/book_appointment_screen.dart';
import 'package:mediviora_app/features/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:mediviora_app/features/screens/explore/explore_screen.dart';
import 'package:mediviora_app/features/screens/hospital_details/hospital_details_screen.dart';
import 'package:mediviora_app/features/screens/payment/payment_screen.dart';
import 'package:mediviora_app/features/screens/profile/profile_screen.dart';
import 'package:mediviora_app/features/screens/schedule/schedule_screen.dart';
import '../features/auth/sign_in/sign_in_screen.dart';
import '../features/auth/sign_up/sign_up_screen.dart';
import '../features/auth/splash/splash_screen.dart';
import 'route_names.dart';

import 'package:go_router/go_router.dart';


class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splashScreen,

    routes: [
      //auth screens
      GoRoute(
        path: RouteNames.splashScreen,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.onBoardingScreen,
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: RouteNames.signInScreen,
        name: 'sign_in',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: RouteNames.signUpScreen,
        name: 'sign_up',
        builder: (context, state) => const SignUpScreen(),
      ),

      //screens
      GoRoute(
        path: RouteNames.bottomNavigationScreen,
        name: 'bottom_bar',
        builder: (context, state) => const BottomNavBarScreen(),
      ),

        GoRoute(
        path: RouteNames.bottomNavigationScreen,
        name: 'home',
        builder: (context, state) => const BottomNavBarScreen(),
      ),

        GoRoute(
        path: RouteNames.exploreScreen,
        name: 'explore',
        builder: (context, state) => const ExploreScreen(),
      ),

        GoRoute(
        path: RouteNames.aiScreen,
        name: 'ai',
        builder: (context, state) => const AiScreen(),
      ),

        GoRoute(
        path: RouteNames.scheduleScreen,
        name: 'schedule',
        builder: (context, state) => const ScheduleScreen(),
      ),

        GoRoute(
        path: RouteNames.profileScreen,
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),



        GoRoute(
        path: RouteNames.paymentScreen,
        name: 'profile',
        builder: (context, state) => const PaymentScreen(),
      ),



        GoRoute(
        path: RouteNames.hospitalDetailsScreen,
        name: 'profile',
        builder: (context, state) => const HospitalDetailsScreen(),
      ),



        GoRoute(
        path: RouteNames.bookAppointmentScreen,
        name: 'profile',
        builder: (context, state) => const BookingScreen(),
      ),



    ],
  );
}
