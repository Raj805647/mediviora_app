import 'package:flutter/material.dart';

Widget appBackground() {
  return Stack(
    children: [
      /// GRADIENT BACKGROUND
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF8FAFC),
              Color(0xFFD9F3FF),
              Color(0xFFF3F0FF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),

      /// TOP GLOW
      Positioned(
        top: -100,
        right: -100,
        child: AnimatedContainer(
          duration: const Duration(seconds: 3),
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF00D1FF).withOpacity(0.1),
          ),
        ),
      ),

      /// BOTTOM GLOW
      Positioned(
        bottom: -100,
        left: -100,
        child: AnimatedContainer(
          duration: const Duration(seconds: 3),
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF8B7CFF).withOpacity(0.1),
          ),
        ),
      ),
    ],
  );
}
