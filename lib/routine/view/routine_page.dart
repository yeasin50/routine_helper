import 'package:flutter/material.dart';

import '../routine.dart';
import 'view.dart';

class RoutinePage extends StatelessWidget {
  const RoutinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CourseSelectionView(),
            SemesterScheduleView(
                mapData: SemesterSchedule.testCLS().dayWiseClass),
          ],
        ),
      ),
    );
  }
}
