import 'package:flutter/material.dart';
import 'package:mediviora_app/routes/route_names.dart';
import 'package:mediviora_app/widget/ui_design.dart';
import 'package:provider/provider.dart';

import '../../../widget/help_widget.dart';
import 'onboarding_provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OnboardingProvider>();
    final step = provider.steps[provider.currentStep];
    return Scaffold(
      body: Stack(
        children: [
        appBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => provider.navigateAndClearStack(context, RouteNames.signInScreen),
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          color: Color(0xFF64748B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: Column(
                        key: ValueKey(provider.currentStep),
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TweenAnimationBuilder(
                            tween: Tween(begin: 0.8, end: 1.0),
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOutBack,
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: value,
                                child: child,
                              );
                            },
                            child: Container(
                              width: 260,
                              height: 260,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(48),
                                gradient: LinearGradient(colors: step['gradient']),
                                boxShadow: [
                                  BoxShadow(
                                    color: step['gradient'].first.withOpacity(0.3),
                                    blurRadius: 30,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.95),
                                  borderRadius: BorderRadius.circular(44),
                                ),
                                child: Center(
                                  child: TweenAnimationBuilder(
                                    tween: Tween(begin: 0.9, end: 1.0),
                                    duration: const Duration(seconds: 2),
                                    curve: Curves.easeInOut,
                                    builder: (context, value, child) {
                                      return Transform.scale(
                                        scale: value,
                                        child: child,
                                      );
                                    },
                                    child: Text(
                                      step['illustration'],
                                      style: const TextStyle(fontSize: 90),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          
                         spaceHeight(50),
                          Text(
                            step['title'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                         spaceHeight(20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              step['description'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                height: 1.6,
                                color: Color(0xFF64748B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(provider.steps.length, (index) {
                      final isActive = index == provider.currentStep;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: isActive ? 40 : 24,
                        height: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: isActive
                              ? const LinearGradient(
                                  colors: [
                                    Color(0xFF00D1FF),
                                    Color(0xFF8B7CFF),
                                  ],
                                )
                              : null,
                          color: isActive ? null : Colors.grey.shade300,
                        ),
                      );
                    }),
                  ),
                 spaceHeight(40),
                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () => provider.nextPage(context),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 8,
                        backgroundColor: Colors.transparent,
                        shadowColor: const Color(0xFF00D1FF).withOpacity(0.4),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF00D1FF), Color(0xFF8B7CFF)],
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                provider.currentStep < provider.steps.length - 1
                                    ? "Continue"
                                    : "Get Started",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Icon(
                                provider.currentStep < provider.steps.length - 1
                                    ? Icons.arrow_forward_ios
                                    : Icons.check,
                                size: 18,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                 spaceHeight(30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
