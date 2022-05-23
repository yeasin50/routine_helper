import 'package:flutter/material.dart';

class AppColor {
  static const double _opacity = .4;

  static Color get social => Colors.deepPurple.withOpacity(_opacity);

  static Color get web => Colors.cyanAccent.withOpacity(_opacity);

  static Color get webLab => Colors.amberAccent.withOpacity(_opacity);
}
