import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';
import 'package:mediviora_app/routes/route_names.dart';

class SignUpProvider extends BaseProvider{
  int currentStep = 1;

  /// LOADING
  bool isLoading = false;

  /// PASSWORD
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  /// TERMS
  bool acceptTerms = false;

  /// COUNTRY
  String selectedCountry = '';

  final countries = [
    {'code': 'US', 'name': 'United States', 'flag': '🇺🇸'},
    {'code': 'GB', 'name': 'United Kingdom', 'flag': '🇬🇧'},
    {'code': 'IN', 'name': 'India', 'flag': '🇮🇳'},
    {'code': 'AE', 'name': 'United Arab Emirates', 'flag': '🇦🇪'},
    {'code': 'TH', 'name': 'Thailand', 'flag': '🇹🇭'},
    {'code': 'SG', 'name': 'Singapore', 'flag': '🇸🇬'},
  ];

  /// CONTROLLERS
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  /// NEXT STEP
  void nextStep() {
    currentStep = 2;
    notifyListeners();
  }

  /// BACK STEP
  void previousStep() {
    currentStep = 1;
    notifyListeners();
  }

  /// PASSWORD TOGGLE
  void togglePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleConfirmPassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  /// TERMS
  void toggleTerms(bool value) {
    acceptTerms = value;
    notifyListeners();
  }

  /// COUNTRY
  void selectCountry(String country) {
    selectedCountry = country;
    notifyListeners();
  }

  /// SIGNUP
  Future<void> signUp(BuildContext context) async {

    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    navigateAndClearStack(context, RouteNames.bottomNavigationScreen);

    isLoading = false;
    notifyListeners();

    /// NAVIGATION
  }

  @override
  void dispose() {

    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();

    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }
}