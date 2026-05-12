import 'package:flutter/material.dart';

import 'help_widget.dart';

Widget customGradientButton({
  required String text,
  required VoidCallback? onTap,
  bool isLoading = false,
  double height = 56,
  double radius = 18,

  /// OPTIONAL ICON
  IconData? icon,

  List<Color> colors = const [
    Color(0xFF00D1FF),
    Color(0xFF8B7CFF),
  ],
}) {
  return SizedBox(
    width: double.infinity,
    height: height,

    child: ElevatedButton(
      onPressed: isLoading ? null : onTap,

      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),

      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),

          gradient: LinearGradient(
            colors: colors,
          ),
        ),

        child: Center(
          child: isLoading
              ? const SizedBox(
            width: 24,
            height: 24,

            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          )
              : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, color: Colors.white,),
                const SizedBox(width: 10),
              ],

              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget socialButton({required String icon, required String text}) {
  return Container(
    height: 54,

    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.9),

      borderRadius: BorderRadius.circular(16),

      border: Border.all(color: Colors.white),
    ),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text(icon, style: const TextStyle(fontSize: 18)),

        const SizedBox(width: 8),

        Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    ),
  );
}
