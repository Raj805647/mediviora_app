import '../features/auth/splash/splash_provider.dart';
im

class ProviderConfig {
  static List<ChangeNotifierProvider> providers = [
    // auth provider
    ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider()),
  ];
}
