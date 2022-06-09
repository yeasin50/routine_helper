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
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SemesterScheduleBetaTemplate(
        isScrolledControlled: true,
        semesterSchedule: semesterSchedule,
      ),
    );
  }
}
