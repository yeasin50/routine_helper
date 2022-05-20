import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../routine.dart';

///
class SemesterScheduleTableTemplate extends StatelessWidget {
  ///create a semester class rountine using [SemesterSchedule].
  ///
  ///* Generate [Table] from data
  ///
  /// use [semesterSchedule] to provide
  ///
  const SemesterScheduleTableTemplate({
    Key? key,
    required this.semesterSchedule,
  }) : super(key: key);

  final SemesterSchedule semesterSchedule;

  @override
  Widget build(BuildContext context) {
    final Map<Weekday, List<RegisteredCourse>?> mapData =
        semesterSchedule.dayWiseClass;

    final activeDays = mapData.keys.toList();

    final columns = mapData.keys
        .map(
          (d) => DataColumn(
            label: Text(d.name),
          ),
        )
        .toList();

    final rows = mapData.keys.map(
      (key) {
        return DataRow(
          cells: List.generate(
            columns.length,
            (index) => DataCell.empty,
          ),
        );
      },
    ).toList();

    return activeDays.isEmpty
        ? const Text("Select Course First")
        // [DayName,     DayName]
        // [Course info, Course info]
        : DataTable(
            border: TableBorder.all(),
            columns: columns,
            rows: rows,
          );
  }
}
