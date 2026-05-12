import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../repositories/auth_repository.dart';

import 'package:flutter/material.dart';

class BaseProvider with ChangeNotifier {
  AuthRepository authRepository = AuthRepository(ApiClient());
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoaded => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Set loading state
  void setLoad(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Set error message
  void setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  /// Clear error
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  /// Helper method to handle async calls safely
  Future<void> execute(Future<void> Function() task) async {
    try {
      setLoad(true);
      clearError();
      await task();
    } catch (e) {
      setError(e.toString());
    } finally {
      setLoad(false);
    }
  }

  /// Push Screen
  void navigateTo(
      BuildContext context,
      String route, {
        Object? extra,
      }) {
    context.push(
      route,
      extra: extra,
    );
  }

  /// Replace Current Screen
  void navigateReplace(
      BuildContext context,
      String route, {
        Object? extra,
      }) {
    context.go(
      route,
      extra: extra,
    );
  }

  /// Clear Stack & Navigate
  void navigateAndClearStack(
      BuildContext context,
      String route, {
        Object? extra,
      }) {
    context.go(
      route,
      extra: extra,
    );
  }

  /// Back
  void back(BuildContext context) {
    context.pop();
  }
}


