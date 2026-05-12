import 'package:mediviora_app/features/auth/onboarding/onboarding_provider.dart';
import 'package:mediviora_app/features/auth/sign_in/sign_in_provider.dart';
import 'package:mediviora_app/features/screens/ai/ai_provider.dart';
import 'package:mediviora_app/features/screens/bottom_nav_bar/bottom_nav_bar_provider.dart';
import 'package:mediviora_app/features/screens/doctor_profile_details/doctor_profile_details_provider.dart';
import 'package:mediviora_app/features/screens/explore/explore_provider.dart';
import 'package:mediviora_app/features/screens/home/home_provider.dart';
import 'package:mediviora_app/features/screens/hospital_details/hospital_details_provider.dart';
import 'package:mediviora_app/features/screens/payment/payment_provider.dart';
import 'package:mediviora_app/features/screens/profile/profile_pprovider.dart';
import 'package:mediviora_app/features/screens/schedule/schedule_provider.dart';

import '../features/auth/sign_up/sign_up_provider.dart';
import '../features/auth/splash/splash_provider.dart';
import 'package:provider/provider.dart';

class ProviderConfig {
  static List<ChangeNotifierProvider> providers = [
    // auth provider
    ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider()),
    ChangeNotifierProvider<OnboardingProvider>(create: (_) => OnboardingProvider()),
    ChangeNotifierProvider<SignInProvider>(create: (_) => SignInProvider()),
    ChangeNotifierProvider<SignUpProvider>(create: (_) => SignUpProvider()),

    //screen
    ChangeNotifierProvider<BottomNavBarProvider>(create: (_) => BottomNavBarProvider()),
    ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
    ChangeNotifierProvider<ExploreProvider>(create: (_) => ExploreProvider()),
    ChangeNotifierProvider<ProfileProvider>(create: (_) => ProfileProvider()),
    ChangeNotifierProvider<ScheduleProvider>(create: (_) => ScheduleProvider()),
    ChangeNotifierProvider<AiProvider>(create: (_) => AiProvider()),
    ChangeNotifierProvider<DoctorProfileDetailsProvider>(create: (_) => DoctorProfileDetailsProvider()),
    ChangeNotifierProvider<HospitalDetailsProvider>(create: (_) => HospitalDetailsProvider()),
    ChangeNotifierProvider<PaymentProvider>(create: (_) => PaymentProvider()),


  ];
}
