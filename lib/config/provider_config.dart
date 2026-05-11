import '../features/auth/splash/splash_provider.dart';
import 'package:provider/provider.dart';

class ProviderConfig {
  static List<ChangeNotifierProvider> providers = [
    // auth provider
    ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider()),
  ];
}
