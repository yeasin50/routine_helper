import 'package:flutter/material.dart';

import '../routine.dart';

class CourseInfoDialog extends StatelessWidget {
  const CourseInfoDialog({
    Key? key,
    required this.course,
  }) : super(key: key);

  final RegisteredCourse course;

  @override
  Widget build(BuildContext context) {
    final title = "${course.courseCode} ${course.section.name}";

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            course.courseTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(course.teacher?.name ?? "NA"),
          const Divider(),

          // class data
          CourseSchedule(classes: course.classes)
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
          ),
          onPressed: Navigator.of(context).pop,
          child: const Text("Close"),
        )
      ],
    );
  }
}
