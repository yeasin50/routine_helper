import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:routine_helper/routine/data/course_info.dart';

import 'models.dart';

class SemesterSchedule extends Equatable {
  final String semesterName;
  final String routineVersion;
  final List<RegisteredCourse> regCourses;

  late final Map<Weekday, RegisteredCourse?> _dayWiseRegCourse;

  SemesterSchedule({
    required this.regCourses,
    required this.routineVersion,
    required this.semesterName,
  }) {
    _dayWiseRegCourse = {};
    _dayWiseClass();
  }
  SemesterSchedule.testCLS()
      : regCourses = AppData.offerCourses,
        routineVersion = "test",
        semesterName = "test" {
    _dayWiseClass();
  }

  SemesterSchedule copyWith({
    List<RegisteredCourse>? classes,
    String? routineVersion,
    String? semesterName,
  }) {
    return SemesterSchedule(
      regCourses: classes ?? this.regCourses,
      routineVersion: routineVersion ?? this.routineVersion,
      semesterName: semesterName ?? this.semesterName,
    );
  }

  ///provide dayWiseRegClasses
  ///todo:
  _dayWiseClass() {
    Map<Weekday, List<RegisteredCourse>> _filteredMap = {};

    for (final day in Weekday.values) {
      for (final course in regCourses) {
        List<Class>? _dayCourse =
            course.classes.where((element) => element.dayName == day).toList();

        final filterdCls = course.copyWith(
          classes: _dayCourse,
        );

        debugPrint(filterdCls.toString());
      }
    }
  }

  @override
  List<Object?> get props => [semesterName, routineVersion, regCourses];
}
