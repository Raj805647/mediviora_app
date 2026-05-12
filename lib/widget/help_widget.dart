import 'package:flutter/material.dart';

SizedBox spaceHeight(double height) {
  return SizedBox(height: height);
}

SizedBox spaceWidth(double width) {
  return SizedBox(width: width);
}

LinearGradient customGradientDesign() {
  return const LinearGradient(
    colors: [Color(0xff7F00FF), Color(0xffE100FF), Color(0xff00C6FF)],
  );
}

Widget glassContainer({
  required Widget child,
  EdgeInsetsGeometry? padding,
  double radius = 24,
}) {
  return Container(
    padding: padding,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),

      color: Colors.white.withOpacity(0.72),

      border: Border.all(
        color: Colors.white.withOpacity(0.5),
      ),

      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    ),

    child: child,
  );
}
