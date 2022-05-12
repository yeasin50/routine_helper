import 'package:flutter/material.dart';
import 'package:routine_helper/routine/routine.dart';

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
      //convert to 12 hour
      final startTime = c.startTime.replacing(hour: c.startTime.hourOfPeriod);
      final endTime = c.endTime.replacing(hour: c.endTime.hourOfPeriod);

      //formating string 00:00
      final String startTimeText =
          "${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}";

      final String endTimeText =
          "${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}";
      return DataRow(
        cells: [
          DataCell(Text(c.dayName.name)),
          DataCell(Text(startTimeText)),
          DataCell(Text(endTimeText)),
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
