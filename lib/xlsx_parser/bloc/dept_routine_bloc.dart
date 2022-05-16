import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../models/dept_routine.dart';
import '../xlsx_parser.dart';

part 'dept_routine_event.dart';
part 'dept_routine_state.dart';

class DeptRoutineBloc extends Bloc<DeptRoutineEvent, DeptRoutineState> {
  DeptRoutineBloc() : super(DeptRoutineInitial()) {
    on<DeptRoutineEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  _onClassGeneration(event, emit) async {
    debugPrint("parser started ***");

    emit(state.copyWith(processState: FilePerserState.loadingAsset));

    ByteData data = await rootBundle.load(RoutineConfig.rouitineFileLoc);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    emit(state.copyWith(processState: FilePerserState.decodingExcel));
    Excel excel = Excel.decodeBytes(bytes);

    ///TODO: use first table for day
    const table = "Day_Routine_V2";

    /// Rows in 1st table [dayRoutine]
    final rows = excel.tables[table]!.rows;

    List<ClassSchedule> classes = [];
    
  }
}

String? _dataToString({required Excel excel, required CellIndex cellIndex}) {
  const table = "Day_Routine_V2";
  return excel[table].rows[cellIndex.rowIndex][cellIndex.columnIndex]?.value;
}
