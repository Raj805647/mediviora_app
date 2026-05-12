import 'dart:math';

import 'package:flutter/material.dart';

class RotatingAiOrb extends StatefulWidget {
  const RotatingAiOrb({super.key});

  @override
  State<RotatingAiOrb> createState() =>
      _RotatingAiOrbState();
}

class _RotatingAiOrbState
    extends State<RotatingAiOrb>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,

      builder: (context, child) {

        final angle = controller.value * 6.28;

        return Transform(
          alignment: Alignment.center,

          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(angle),

          child: child,
        );
      },

      child: Stack(
        alignment: Alignment.center,

        children: [

          /// MAIN ORB
          Container(
            width: 110,
            height: 110,

            decoration: BoxDecoration(
              shape: BoxShape.circle,

              gradient: const LinearGradient(
                colors: [
                  Color(0xFF00D1FF),
                  Color(0xFF8B7CFF),
                ],
              ),

              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF00D1FF)
                      .withOpacity(0.35),
                  blurRadius: 30,
                  spreadRadius: 8,
                ),
              ],
            ),

            child: const Icon(
              Icons.auto_awesome,
              color: Colors.white,
              size: 42,
            ),
          ),

          /// ANIMATED DOT 1
          AnimatedBuilder(
            animation: controller,

            builder: (context, _) {

              final angle =
                  controller.value * 6.28;

              return Transform.translate(
                offset: Offset(
                  65 * cos(angle),
                  65 * sin(angle),
                ),

                child: Container(
                  width: 10,
                  height: 10,

                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),

          /// ANIMATED DOT 2
          AnimatedBuilder(
            animation: controller,

            builder: (context, _) {

              final angle =
                  (controller.value * 6.28) + 2;

              return Transform.translate(
                offset: Offset(
                  75 * cos(angle),
                  75 * sin(angle),
                ),

                child: Container(
                  width: 7,
                  height: 7,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              );
            },
          ),

          /// ANIMATED DOT 3
          AnimatedBuilder(
            animation: controller,

            builder: (context, _) {

              final angle =
                  (controller.value * 6.28) + 4;

              return Transform.translate(
                offset: Offset(
                  58 * cos(angle),
                  58 * sin(angle),
                ),

                child: Container(
                  width: 6,
                  height: 6,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}