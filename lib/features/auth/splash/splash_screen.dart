import 'package:flutter/material.dart';

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mediviora_app/features/auth/splash/splash_provider.dart';
import 'package:provider/provider.dart';

/// -------------------- BASE PROVIDER --------------------
/// -------------------- SPLASH SCREEN --------------------
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashProvider(),
      child: const _SplashView(),
    );
  }
}

/// -------------------- SPLASH VIEW --------------------
class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SplashProvider>(context, listen: false);
    final particles = provider.generateParticles(30);

    return Scaffold(
      body: Stack(
        children: [
          /// Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0B1F3A),
                  Color(0xFF00D1FF),
                  Color(0xFF8B7CFF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          /// Animated Mesh Circles
          const Positioned.fill(
            child: _AnimatedBackground(),
          ),

          /// Floating Particles
          ...particles.map((particle) => _FloatingParticle(
            particle: particle,
          )),

          /// Main Content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Glow + Logo
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.elasticOut,
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Opacity(
                        opacity: value,
                        child: child,
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      /// Glow
                      AnimatedContainer(
                        duration: const Duration(seconds: 3),
                        width: 280,
                        height: 280,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF00D1FF)
                                  .withOpacity(0.4),
                              blurRadius: 60,
                              spreadRadius: 20,
                            ),
                          ],
                        ),
                      ),

                      /// Logo
                      Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              /// Logo Glow
                              Container(
                                width: 220,
                                height: 220,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.08),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.25),
                                      blurRadius: 80,
                                      spreadRadius: 10,
                                    ),
                                  ],
                                ),
                              ),

                              /// Image
                              Positioned.fill(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Image.asset(
                                    "assets/image.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),

                              /// Sparkle Icon
                              const Positioned(
                                top: -10,
                                right: -10,
                                child: _RotatingSparkle(),
                              ),
                            ],
                          ),

                          const SizedBox(height: 40),

                          /// Subtitle
                          const Text(
                            "Connecting Healthcare Worldwide",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.8,
                            ),
                          ),

                          const SizedBox(height: 30),

                          /// Loading Dots
                          const _LoadingDots(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// Bottom Fade
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0B1F3A),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// -------------------- ANIMATED BACKGROUND --------------------
class _AnimatedBackground extends StatefulWidget {
  const _AnimatedBackground();

  @override
  State<_AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<_AnimatedBackground>
    with TickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Stack(
          children: [
            Positioned(
              left: 40 + controller.value * 20,
              top: 100 + controller.value * 20,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF00D1FF).withOpacity(0.15),
                ),
              ),
            ),
            Positioned(
              right: 40 + controller.value * 20,
              bottom: 120 + controller.value * 20,
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF8B7CFF).withOpacity(0.18),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

/// -------------------- FLOATING PARTICLE --------------------
class _FloatingParticle extends StatefulWidget {
  final ParticleModel particle;

  const _FloatingParticle({
    required this.particle,
  });

  @override
  State<_FloatingParticle> createState() => _FloatingParticleState();
}

class _FloatingParticleState extends State<_FloatingParticle>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: (widget.particle.duration * 1000).toInt(),
      ),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Positioned(
          left: widget.particle.left * size.width,
          top: (widget.particle.top * size.height) -
              (controller.value * 40),
          child: Opacity(
            opacity: 0.2 + (controller.value * 0.8),
            child: Container(
              width: widget.particle.size,
              height: widget.particle.size,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

/// -------------------- ROTATING SPARKLE --------------------
class _RotatingSparkle extends StatefulWidget {
  const _RotatingSparkle();

  @override
  State<_RotatingSparkle> createState() => _RotatingSparkleState();
}

class _RotatingSparkleState extends State<_RotatingSparkle>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: controller,
      child: const Icon(
        Icons.auto_awesome,
        color: Colors.white,
        size: 32,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

/// -------------------- LOADING DOTS --------------------
class _LoadingDots extends StatelessWidget {
  const _LoadingDots();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
            (index) => _AnimatedDot(delay: index * 0.2),
      ),
    );
  }
}

class _AnimatedDot extends StatefulWidget {
  final double delay;

  const _AnimatedDot({
    required this.delay,
  });

  @override
  State<_AnimatedDot> createState() => _AnimatedDotState();
}

class _AnimatedDotState extends State<_AnimatedDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ScaleTransition(
        scale: Tween(begin: 1.0, end: 1.5).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              widget.delay,
              1.0,
              curve: Curves.easeInOut,
            ),
          ),
        ),
        child: FadeTransition(
          opacity: Tween(begin: 0.4, end: 1.0).animate(controller),
          child: Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}