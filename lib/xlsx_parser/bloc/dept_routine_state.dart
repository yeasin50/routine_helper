part of 'dept_routine_bloc.dart';

class DeptRoutineState extends Equatable {
  const DeptRoutineState({
    this.routine,
    required this.processState,
  });

  final DepartmentRoutine? routine;

  // we can include teacher info perser+ number of class loaded etc
  final FilePerserState processState;

  @override
  List<Object?> get props => [routine, processState];

  DeptRoutineState copyWith({
    DepartmentRoutine? routine,
    FilePerserState? processState,
  }) {
    return DeptRoutineState(
      routine: routine ?? this.routine,
      processState: processState ?? this.processState,
    );
  }

  @override
  String toString() =>
      'DeptRoutineState(routine: ${routine.toString()}, processState: ${processState.name})';
}

class DeptRoutineInitial extends DeptRoutineState {
  const DeptRoutineInitial() : super(processState: FilePerserState.started);
}
