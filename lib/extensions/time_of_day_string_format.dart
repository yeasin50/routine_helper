import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  ///convert to 12h then and formating string 00:00
  String get formatToString {
    final h = replacing(hour: hourOfPeriod).hour.toString().padLeft(2, '0');
    final m = replacing(hour: hourOfPeriod).minute.toString().padLeft(2, '0');
    return "$h:$m";
  }
}
