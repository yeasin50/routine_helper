// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum Weekday {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}

class Class extends Equatable {
  final Weekday dayName;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String place;

  const Class({
    required this.dayName,
    required this.startTime,
    required this.endTime,
    required this.place,
  });

  /// class time 11:30-01:00
  const Class.t11_30({
    required this.dayName,
    required this.place,
  })  : startTime = const TimeOfDay(hour: 11, minute: 30),
        endTime = const TimeOfDay(hour: 13, minute: 00);

  /// class time 10:00-11:30
  const Class.t10({
    required this.dayName,
    required this.place,
  })  : startTime = const TimeOfDay(hour: 10, minute: 00),
        endTime = const TimeOfDay(hour: 11, minute: 30);

  Class copyWith({
    Weekday? dayName,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    String? place,
  }) {
    return Class(
      dayName: dayName ?? this.dayName,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      place: place ?? this.place,
    );
  }

  @override
  String toString() {
    return 'Class(dayName: $dayName, startTime: $startTime, endTime: $endTime, place: $place)';
  }

  @override
  List<Object?> get props => [
        dayName,
        startTime,
        endTime,
        place,
      ];
}
