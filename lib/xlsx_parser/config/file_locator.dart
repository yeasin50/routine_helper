import 'package:excel/excel.dart';

class RoutineConfig {
  /// routine xlsx file location on assets folder
  static String get rouitineFileLoc =>
      "assets/routine_file/Class_Routine_Spring_2022.xlsx";

  ///* Note row&cell Index start from 1, instead of 0

  /// semester info locator data is located on CellIndex(1, 15): to get "Semester: Spring 2022"
  ///```
  ///excel[table].rows[RoutineConfig.semeterNameIndex.rowIndex][RoutineConfig.semeterNameIndex.rowIndex]
  ///```
  static CellIndex get semeterNameIndex =>
      CellIndex.indexByColumnRow(rowIndex: 1, columnIndex: 15);

  static CellIndex get departmentNameIndex =>
      CellIndex.indexByColumnRow(rowIndex: 2, columnIndex: 7);

  static CellIndex get routineCampusIndex =>
      CellIndex.indexByColumnRow(rowIndex: 3, columnIndex: 7);

  static CellIndex get routineVersionIndex =>
      CellIndex.indexByColumnRow(rowIndex: 3, columnIndex: 16);

  static CellIndex get effectiveDataIndex =>
      CellIndex.indexByColumnRow(rowIndex: 4, columnIndex: 1);

  static CellIndex get authorDataIndex =>
      CellIndex.indexByColumnRow(rowIndex: 4, columnIndex: 14);
}
