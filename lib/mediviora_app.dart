import 'package:flutter/material.dart';
import 'package:mediviora_app/routes/app_routes.dart';
import 'package:mediviora_app/routes/route_names.dart';

import 'config/provider_config.dart';
import 'package:provider/provider.dart';

class MedivioraApp extends StatelessWidget {
  const MedivioraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiProvider(
        providers: ProviderConfig.providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Grownidhi App',
          initialRoute: RouteNames.splashScreen,
          routes: AppRoutes.routes,
      
          theme: ThemeData(
            fontFamily: 'Iosef',
          ),
        ),
      ),
    );
  }}
