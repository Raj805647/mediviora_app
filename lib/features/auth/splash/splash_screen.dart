import 'package:flutter/material.dart';
import 'package:mediviora_app/core/constants/app_images.dart';

import 'package:mediviora_app/features/auth/splash/splash_provider.dart';
import 'package:provider/provider.dart';

import '../../../widget/help_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  late final AnimationController backgroundController;
  late final AnimationController sparkleController;
  late final AnimationController dotsController;

  final List<AnimationController> particleControllers = [];

  @override
  void initState() {
    super.initState();

    /// Navigation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashProvider>().init(context);
    });

    /// Background Animation
    backgroundController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);

    /// Sparkle Rotation
    sparkleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    /// Loading Dots
    dotsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    /// Particle Controllers
    final provider = context.read<SplashProvider>();

    for (var particle in provider.generateParticles(30)) {
      final controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: (particle.duration * 1000).toInt(),
        ),
      )..repeat(reverse: true);

      particleControllers.add(controller);
    }
  }

  @override
  void dispose() {
    backgroundController.dispose();
    sparkleController.dispose();
    dotsController.dispose();

    for (var controller in particleControllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<SplashProvider>();
    final particles = provider.generateParticles(30);

    return Scaffold(
      body: Stack(
        children: [

          /// Background Gradient
          _backgroundGradient(),

          /// Animated Background
          _animatedBackground(),

          /// Floating Particles
          ...List.generate(
            particles.length,
                (index) => _floatingParticle(
              particles[index],
              particleControllers[index],
            ),
          ),

          /// Main Content
          _mainContent(),

          /// Bottom Fade
          _bottomFade(),
        ],
      ),
    );
  }

  /// =====================================================
  /// BACKGROUND
  /// =====================================================

  Widget _backgroundGradient() {
    return Container(
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
    );
  }

  /// =====================================================
  /// ANIMATED BACKGROUND
  /// =====================================================

  Widget _animatedBackground() {
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: backgroundController,
        builder: (_, __) {
          return Stack(
            children: [

              /// Left Circle
              Positioned(
                left: 40 + backgroundController.value * 20,
                top: 100 + backgroundController.value * 20,
                child: _animatedCircle(
                  size: 260,
                  color: const Color(0xFF00D1FF).withOpacity(0.15),
                ),
              ),

              /// Right Circle
              Positioned(
                right: 40 + backgroundController.value * 20,
                bottom: 120 + backgroundController.value * 20,
                child: _animatedCircle(
                  size: 220,
                  color: const Color(0xFF8B7CFF).withOpacity(0.18),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _animatedCircle({
    required double size,
    required Color color,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  /// =====================================================
  /// FLOATING PARTICLES
  /// =====================================================

  Widget _floatingParticle(
      ParticleModel particle,
      AnimationController controller,
      ) {
    final size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Positioned(
          left: particle.left * size.width,
          top: (particle.top * size.height) -
              (controller.value * 40),

          child: Opacity(
            opacity: (0.2 + controller.value * 0.8)
                .clamp(0.0, 1.0),

            child: Container(
              width: particle.size,
              height: particle.size,
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

  /// =====================================================
  /// MAIN CONTENT
  /// =====================================================

  Widget _mainContent() {
    return Center(
      child: SingleChildScrollView(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 1200),
          curve: Curves.elasticOut,

          builder: (context, value, child) {
            return Transform.scale(
              scale: value,

              child: Opacity(
                opacity: value.clamp(0.0, 1.0),
                child: child,
              ),
            );
          },

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// Logo Section
              _logoSection(),

              spaceHeight(40),

              /// Subtitle
              const Text(
                "Connecting Healthcare Worldwide",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),

              spaceHeight(30),

              /// Loading Dots
              _loadingDots(),
            ],
          ),
        ),
      ),
    );
  }

  /// =====================================================
  /// LOGO SECTION
  /// =====================================================

  Widget _logoSection() {
    return Stack(
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
                  AppImages.appLogo,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            /// Sparkle
            Positioned(
              top: -10,
              right: -10,
              child: RotationTransition(
                turns: sparkleController,

                child: const Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// =====================================================
  /// LOADING DOTS
  /// =====================================================

  Widget _loadingDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: List.generate(
        4,
            (index) => _animatedDot(index),
      ),
    );
  }

  Widget _animatedDot(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),

      child: AnimatedBuilder(
        animation: dotsController,

        builder: (_, __) {

          final animationValue =
          Tween(begin: 1.0, end: 1.5).evaluate(
            CurvedAnimation(
              parent: dotsController,
              curve: Interval(
                index * 0.2,
                1.0,
                curve: Curves.easeInOut,
              ),
            ),
          );

          return Transform.scale(
            scale: animationValue,

            child: Opacity(
              opacity: (0.4 + dotsController.value * 0.6)
                  .clamp(0.0, 1.0),

              child: Container(
                width: 10,
                height: 10,

                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// =====================================================
  /// BOTTOM FADE
  /// =====================================================

  Widget _bottomFade() {
    return Align(
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
    );
  }
}
