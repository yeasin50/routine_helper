import 'package:flutter/material.dart';

import '../routine.dart';

class RoutinePage extends StatefulWidget {
  const RoutinePage({Key? key}) : super(key: key);

  @override
  State<RoutinePage> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  SemesterSchedule semesterSchedule = SemesterSchedule(
      regCourses: [], routineVersion: "x.x", semesterName: "Test");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CourseSelectionView(
              onCourseSelectionChange: (selectedCourse) {
                semesterSchedule =
                    semesterSchedule.copyWith(classes: selectedCourse);
                setState(() {});
              },
            ),
            SemesterScheduleView(
              semesterSchedule: semesterSchedule,
            ),
          ],
        ),
      ),
    );
  }
}
