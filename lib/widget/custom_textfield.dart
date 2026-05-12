import 'package:flutter/material.dart';

Widget customTextField({
  required String label,
  required String hintText,
  required TextEditingController controller,

  IconData? prefixIcon,
  Widget? suffixIcon,

  bool obscureText = false,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

      Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xFF0F172A),
        ),
      ),

      const SizedBox(height: 10),

      TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,

        decoration: InputDecoration(
          hintText: hintText,

          prefixIcon:
          prefixIcon != null
              ? Icon(prefixIcon)
              : null,

          suffixIcon: suffixIcon,

          filled: true,
          fillColor: Colors.white.withOpacity(0.8),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),

            borderSide: const BorderSide(
              color: Color(0xFF00D1FF),
            ),
          ),
        ),
      ),
    ],
  );
}