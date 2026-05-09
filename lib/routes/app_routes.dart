import 'package:flutter/material.dart';
import '../features/auth/splash/splash_screen.dart';
import 'route_names.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    // Auth Screens
    RouteNames.splashScreen: (context) => SplashScreen(),
  };

}