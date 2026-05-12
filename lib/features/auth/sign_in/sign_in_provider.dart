import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';

import '../../../routes/route_names.dart';

class SignInProvider extends BaseProvider{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

  void togglePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    navigateAndClearStack(context, RouteNames.bottomNavigationScreen);

    isLoading = false;
    notifyListeners();

  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}