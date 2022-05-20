import 'package:flutter/material.dart';

import '../routine.dart';

class SemesterScheduleView extends StatelessWidget {
  ///create a semester class rountine using [SemesterSchedule]
  ///
  /// use [semesterSchedule] to provide
  const SemesterScheduleView({
    Key? key,
    required this.semesterSchedule,
  }) : super(key: key);

  final SemesterSchedule semesterSchedule;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SemesterScheduleTableTemplate(
        semesterSchedule:
            semesterSchedule.copyWith(classes: AppData.offerCourses),
      ),
      // SemesterScheduleBetaTemplate(
      //   semesterSchedule: semesterSchedule,
      // ),
    );
  }
}