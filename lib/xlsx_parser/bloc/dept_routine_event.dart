part of 'dept_routine_bloc.dart';

abstract class DeptRoutineEvent extends Equatable {
  const DeptRoutineEvent();

  @override
  List<Object> get props => [];
}

class RoutineGenerateEvent extends DeptRoutineEvent {}
