import 'dart:core';

import 'package:equatable/equatable.dart';

import '../routine.dart';

class SemesterSchedule extends Equatable {
  final String semesterName;
  final String routineVersion;
  final List<RegisteredCourse> regCourses;

  late final Map<Weekday, List<RegisteredCourse>?> _dayWiseRegCourse =
      _dayWiseClass();

  Map<Weekday, List<RegisteredCourse>?> get dayWiseClass => _dayWiseRegCourse;

  ///create Semester class shedule
  SemesterSchedule({
    required this.regCourses,
    required this.routineVersion,
    required this.semesterName,
  });

  SemesterSchedule.testCLS()
      : regCourses = AppData.offerCourses,
        routineVersion = "test",
        semesterName = "test";

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
  ///todo: Recheck
  Map<Weekday, List<RegisteredCourse>> _dayWiseClass() {
    Map<Weekday, List<RegisteredCourse>> _filteredMap = {};
    for (final day in Weekday.values) {
      for (final course in regCourses) {
        List<Class>? _dayCourse =
            course.classes.where((element) => element.dayName == day).toList();

        if (_dayCourse.isEmpty) continue;
        final filterdCls = course.copyWith(classes: _dayCourse);

        if (_filteredMap.containsKey(day)) {
          _filteredMap[day]!.add(filterdCls);
        } else {
          _filteredMap[day] = [filterdCls];
        }
      }
    }

    return _filteredMap;
  }

  @override
  List<Object?> get props => [semesterName, routineVersion, regCourses];
}
