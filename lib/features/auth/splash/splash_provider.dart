import 'dart:math';

import 'package:base_module/providers/base_providers.dart';

/// -------------------- SPLASH PROVIDER --------------------
class SplashProvider extends BaseProvider {
  final Random _random = Random();

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

/// -------------------- PARTICLE MODEL --------------------
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