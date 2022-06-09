import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../routine.dart';

///
class SemesterScheduleBetaTemplate extends StatelessWidget {
  ///create a semester class routine using [SemesterSchedule].
  ///
  ///* Generate [ListView] from data
  ///
  /// use [semesterSchedule] to provide
  ///
  const SemesterScheduleBetaTemplate({
    Key? key,
    required this.semesterSchedule,
    this.isScrolledControlled = true,
  }) : super(key: key);

  final SemesterSchedule semesterSchedule;

  final bool isScrolledControlled;

  @override
  Widget build(BuildContext context) {
    final Map<Weekday, List<RegisteredCourse>?> mapData =
        semesterSchedule.dayWiseClass;

    List<Widget> classes = [];

    for (final day in mapData.keys) {
      if (mapData[day] != null) {
        classes
          ..add(buildDayClasses(day, mapData[day]!))
          ..add(const SizedBox(
            height: 12,
          ));
      }
    }

    return Column(
      children: classes,
    );
  }

  Column buildDayClasses(Weekday day, List<RegisteredCourse> todayRegCourse) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // week day name
        Text(
          day.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        //classes [time, course code, room, section]
        ...todayRegCourse.map(
          (RegisteredCourse regCourse) {
            return Container(
              //color based on course name
              color: regCourse.color,
              child: Column(
                children: regCourse.classes
                    .map(
                      (Class cls) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "${cls.startTime.formatToString}- ${cls.endTime.formatToString}",
                          ),
                          Text(regCourse.courseCode),
                          Text(cls.place),
                          Text(regCourse.section.name),
                          Text(regCourse.teacher!.name)
                        ]
                            .map(
                              (e) => Expanded(
                                // padding:
                                //     const EdgeInsets.only(right: 24),
                                child: e,
                              ),
                            )
                            .toList(),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        ).toList()
      ],
    );
  }
}
