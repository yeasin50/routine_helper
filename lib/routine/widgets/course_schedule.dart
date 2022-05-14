import 'package:flutter/material.dart';

import '../../extensions/extensions.dart';
import '../routine.dart';

class CourseSchedule extends StatelessWidget {
  final List<Class> classes;

  /// provide [DataTable]  from [List<Class]>] used on [CourseInfoDialog]
  ///
  /// * [DataTable] is wrapped with [SingleChildScrollView] to handle right overflow-error
  ///
  /// ```
  /// CourseSchedule(classes: course.classes)
  /// ```
  const CourseSchedule({
    Key? key,
    required this.classes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle headerTextStyle = TextStyle(fontStyle: FontStyle.italic);

    const List<DataColumn> headers = [
      DataColumn(label: Text('Day')),
      DataColumn(label: Text('Start ')),
      DataColumn(label: Text('End ')),
      DataColumn(label: Text('Room no')),
    ];

    DataRow _classToDataRow(Class c) {
      return DataRow(
        cells: [
          DataCell(Text(c.dayName.name)),
          DataCell(Text(c.startTime.formatToString)),
          DataCell(Text(c.endTime.formatToString)),
          DataCell(Text(c.place)),
        ],
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingTextStyle: headerTextStyle,
        columns: headers,
        rows: classes.map(_classToDataRow).toList(),
      ),
    );
  }
}
