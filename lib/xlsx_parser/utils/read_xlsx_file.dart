import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:routine_helper/routine/routine.dart';
import 'package:routine_helper/xlsx_parser/models/dept_routine.dart';
import 'package:routine_helper/xlsx_parser/xlsx_parser.dart';

import '../config/config.dart';

String dataToString({required Excel excel, required CellIndex cellIndex}) {
  // const table = "Day_Routine_V2";
  return excel[excel.tables.keys.first]
          .rows[cellIndex.rowIndex][cellIndex.columnIndex]
          ?.value ??
      "Cant find";
}

Future<DepartmentRoutine> fileReading() async {
  debugPrint("parser started ***");
  ByteData data = await rootBundle.load(RoutineConfig.rouitineFileLoc);
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  Excel excel = Excel.decodeBytes(bytes);

  // for (var table in excel.tables.keys) {
  final table = "Day_Routine_V2";
  // print(table); //sheet Name
  // print(excel.tables[table]?.maxCols);
  // print(excel.tables[table]?.maxRows);

  final semster =
      dataToString(excel: excel, cellIndex: RoutineConfig.semeterNameIndex);

  final departmentName =
      dataToString(excel: excel, cellIndex: RoutineConfig.departmentNameIndex);
  final routineCampus =
      dataToString(excel: excel, cellIndex: RoutineConfig.routineCampusIndex);

  final effectiveData =
      dataToString(excel: excel, cellIndex: RoutineConfig.effectiveDataIndex);

  final author =
      dataToString(excel: excel, cellIndex: RoutineConfig.authorDataIndex);

  DepartmentRoutine routine = DepartmentRoutine(
      departmentName: departmentName,
      routineCampus: routineCampus,
      effectiveData: effectiveData,
      semster: semster,
      author: author,
      clsses: []);

  // debugPrint(routine.toString());

  /// Rows in 1st table [dayRoutine]
  final rows = excel.tables[table]!.rows;

  ///* data index checkUP
  // for (int i = 0; i < 6; i++) {
  //   final List<Data?> rowData = rows[i];
  //   for (final data in rowData) {
  //     if (data != null) {
  //       debugPrint(" cellI ${data.cellIndex} : ${data.toString()}");
  //     }
  //   }
  // }

  routine = routine.copyWith(clsses: getClasses(excel));
  debugPrint("parser END ***");

  return routine;
}

List<ClassSchedule> getClasses(Excel excel) {
  //* Routine Data>> row start from 6[Saturday]

  /// classes range [1,2,3]= [room, course, teacher]
  final List<ClassSchedule> classes = [];

  /// as for class time we get 6/7 indexes

  //* weekDay cellIndex
  final rows = excel[excel.tables.keys.first].rows;

  String? currentDay;
  List<String> timeSlot = [];

  ///getting days, we can simply start row from 6th
  for (int i = 0; i < rows.length; i++) {
    final cells = rows[i];
    // single row with multiple cell
    for (int j = 0; j < cells.length; j++) {
      final cell = cells[j];
      if (cell != null) {
        ///while we get the dayName, we need to store the day name and also check if it is overlapping with previouse one,
        /// next line we will create list<String> time slot
        /// we can skip next row
        ///*  data xlsx issue on
        if (_gotNewDay(cell.value.toString())) {
          // debugPrint("cellId ${cell.cellIndex}  value ${cell.value}");
          currentDay = cell.value;

          ///*init timeSlot increasing/moving to next row
          timeSlot = _generateTimeSlot(row: rows[i + 1]);
          // debugPrint(timeSlot.toString());

          //skip next row including previ [timeSlot+ [room,course.....]]
          i = i + 2;
          break;
        }

        /// we will get extract class schedule block [Room, course, teacher]
        /// jump cell[j] by 3index, as formated sheet, classSchedule data follow [0,1,2], [3,4,5],
        else if (j + 2 < cells.length && cells[j + 2] != null) {
          final room = cells[j];
          final course = cells[j + 1];
          final teacher = cells[j + 2];

          if (teacher != null) {
            // debugPrint(
            //     " r:${room!.value} c:${course?.value} t:${teacher.value}");

            classes.add(
              ClassSchedule(
                dayName: currentDay ?? "",
                timeSlot: timeSlot[j / 3 >= timeSlot.length ? 0 : j ~/ 3],
                roomNo: room!.value.toString().replaceAll("\n", ""),
                course: (course?.value.toString() ?? "").replaceAll("\n", ""),
                teacher: teacher.value..toString().replaceAll("\n", ""),
              ),
            );
          }
          j += 2;
        }
      }
    }
  }

  return classes;
}

List<String> _generateTimeSlot({required List<Data?> row}) {
  List<String> _timeSlot = [];

  for (final cell in row) {
    if (cell != null) _timeSlot.add(cell.value);
  }

  return _timeSlot;
}

bool _gotNewDay(String data) {
  final List<String> weekDays =
      Weekday.values.map((e) => e.name.toLowerCase()).toList();
  return weekDays.contains(data.toLowerCase());
}
