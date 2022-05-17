import 'package:equatable/equatable.dart';

import '../xlsx_parser.dart';

class DepartmentRoutine extends Equatable {
  final String departmentName;
  final String routineCampus;
  final String semster;
  final String effectiveData;
  final String author;

  final List<ClassSchedule> clsses;

  const DepartmentRoutine({
    required this.departmentName,
    required this.routineCampus,
    required this.effectiveData,
    required this.semster,
    required this.author,
    required this.clsses,
  });

  @override
  List<Object?> get props =>
      [departmentName, routineCampus, semster, effectiveData, author, clsses];

 

  @override
  String toString() {
    return 'DepartmentRoutine(departmentName: $departmentName, semester $semster, routineCampus: $routineCampus, effectiveData: $effectiveData, author: $author, clsses: $clsses)';
  }

  DepartmentRoutine copyWith({
    String? departmentName,
    String? routineCampus,
    String? semster,
    String? effectiveData,
    String? author,
    List<ClassSchedule>? clsses,
  }) {
    return DepartmentRoutine(
      departmentName: departmentName ?? this.departmentName,
      routineCampus: routineCampus ?? this.routineCampus,
      semster: semster ?? this.semster,
      effectiveData: effectiveData ?? this.effectiveData,
      author: author ?? this.author,
      clsses: clsses ?? this.clsses,
    );
  }
}
