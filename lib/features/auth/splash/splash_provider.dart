import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:base_module/providers/base_providers.dart';
import 'package:mediviora_app/routes/route_names.dart';

class SplashProvider extends BaseProvider {
  final Random _random = Random();
  late final AnimationController backgroundController;
  late final AnimationController sparkleController;
  late final AnimationController dotsController;

  final List<AnimationController> particleControllers = [];

  void init(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      print('adbfhdsaf');
      navigateAndClearStack(context, RouteNames.onBoardingScreen);
    });
  }

  List<ParticleModel> generateParticles(int count) {
    return List.generate(
      count,
      (index) => ParticleModel(
        left: _random.nextDouble(),
        top: _random.nextDouble(),
        size: 2 + _random.nextDouble() * 4,
        duration: 2 + _random.nextDouble() * 4,
        delay: _random.nextDouble() * 2,
      ),
    );
  }
}

class ParticleModel {
  final double left;
  final double top;
  final double size;
  final double duration;
  final double delay;

  ParticleModel({
    required this.left,
    required this.top,
    required this.size,
    required this.duration,
    required this.delay,
  });
}
