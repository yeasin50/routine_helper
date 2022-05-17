import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  GlassMorphism({
    Key? key,
    required this.blur,
    required this.opacity,
    required this.child,
    this.color = const Color(0xFF454A4D),
    BorderRadius? borderRadius,
  })  : _borderRadius = borderRadius ?? BorderRadius.circular(12),
        super(key: key);

  final double blur;
  final double opacity;
  final Widget child;
  final Color color;

  final BorderRadius _borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blur,
          sigmaY: blur,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(opacity),
            borderRadius: _borderRadius,
            border: Border.all(
              color: color.withOpacity(.2),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
