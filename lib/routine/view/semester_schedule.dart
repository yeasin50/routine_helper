import 'package:flutter/material.dart';

import '../routine.dart';

class SemesterScheduleView extends StatelessWidget {
  const SemesterScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Class> classes = [];

    AppData.offerCourses.forEach((v) {
      classes.addAll(v.classes);
    });

    return Container();
  }
}
