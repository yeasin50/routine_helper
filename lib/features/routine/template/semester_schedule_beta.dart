import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../routine.dart';

///
class SemesterScheduleBetaTemplate extends StatelessWidget {
  ///create a semester class rountine using [SemesterSchedule].
  ///
  ///* Generate [ListView] from data
  ///
  /// use [semesterSchedule] to provide
  ///
  const SemesterScheduleBetaTemplate({
    Key? key,
    required this.semesterSchedule,
  }) : super(key: key);

  final SemesterSchedule semesterSchedule;

  @override
  Widget build(BuildContext context) {
    final Map<Weekday, List<RegisteredCourse>?> mapData =
        semesterSchedule.dayWiseClass;

    return ListView.separated(
      itemCount: mapData.keys.toList().length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final key = mapData.keys.toList()[index];
        final todayRegCourse = mapData[key];

        return todayRegCourse == null
            ? const SizedBox()
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // week day name
                  Text(key.name),
                  //clases [time, course code, room, section]
                  ...todayRegCourse.map(
                    (RegisteredCourse regCourse) {
                      return Column(
                        children: regCourse.classes
                            .map(
                              (Class cls) => Row(
                                children: [
                                  Text(
                                    "${cls.startTime.formatToString}- ${cls.endTime.formatToString}",
                                  ),
                                  Text(regCourse.courseCode),
                                  Text(cls.place),
                                  Text(regCourse.section.name),
                                ]
                                    .map(
                                      (e) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 24),
                                        child: e,
                                      ),
                                    )
                                    .toList(),
                              ),
                            )
                            .toList(),
                      );
                    },
                  ).toList()
                ],
              );
      },
    );
  }
}
