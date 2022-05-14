import 'package:flutter/material.dart';

import '../../extensions/extensions.dart';
import '../routine.dart';

class SemesterScheduleView extends StatelessWidget {

  ///create a semester class rountine using `Map<Weekday, List<RegisteredCourse>?>` 
  ///
  /// use [mapData] to provide 
  const SemesterScheduleView({
    Key? key,
    required this.mapData,
  }) : super(key: key);

  final Map<Weekday, List<RegisteredCourse>?> mapData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: mapData.keys.toList().length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final key = mapData.keys.toList()[index];
          final todayRegCourse = mapData[key];

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(key.name),
              ...todayRegCourse!.map(
                (RegisteredCourse regCourse) {
                  return Column(
                    children: regCourse.classes
                        .map(
                          (Class cls) => Row(
                            children: [
                              Text(
                                "${cls.startTime.formatToString}- ${cls.endTime.formatToString}",
                              ),
                              Text(regCourse.course.courseCode),
                              Text(cls.place),
                              Text(regCourse.section.name),
                            ]
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(right: 24),
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
      ),
    );
  }
}
