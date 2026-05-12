import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';
import 'package:mediviora_app/routes/route_names.dart';

class OnboardingProvider extends BaseProvider {
  int currentStep = 0;

  final List<Map<String, dynamic>> steps = [
    {
      'title': 'AI-Powered Medical Discovery',
      'description':
          'Find the perfect treatment and hospital worldwide with our advanced AI matching technology',
      'illustration': '🤖',
      'gradient': [const Color(0xFF00D1FF), const Color(0xFF8B7CFF)],
    },
    {
      'title': 'Global Hospital Network',
      'description':
          'Access 10,000+ world-class hospitals across 50+ countries',
      'illustration': '🏥',
      'gradient': [const Color(0xFF00C48C), const Color(0xFF00D1FF)],
    },
    {
      'title': 'Complete Medical Tourism',
      'description':
          'We handle visa, travel, accommodation and recovery support',
      'illustration': '✈️',
      'gradient': [const Color(0xFF8B7CFF), const Color(0xFFFF6B9D)],
    },
    {
      'title': '24/7 Recovery Support',
      'description': 'AI-assisted recovery tracking and telemedicine support',
      'illustration': '💚',
      'gradient': [const Color(0xFF00C48C), const Color(0xFF00D1FF)],
    },
    {
      'title': 'Secure & Trusted',
      'description': 'Bank-level encryption and verified medical records',
      'illustration': '🔒',
      'gradient': [const Color(0xFF0B1F3A), const Color(0xFF00D1FF)],
    },
  ];

  void nextPage(BuildContext context) {
    if (currentStep < steps.length - 1) {
      currentStep++;
      notifyListeners();
    } else {
     navigateAndClearStack(context, RouteNames.signInScreen);
    }
  }
}
