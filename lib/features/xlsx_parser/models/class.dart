import 'package:equatable/equatable.dart';

class ClassSchedule extends Equatable {
  final String dayName;
  final String timeSlot;
  final String roomNo;
  final String course;
  final String teacher;

  const ClassSchedule({
    required this.dayName,
    required this.timeSlot,
    required this.roomNo,
    required this.course,
    required this.teacher,
  });

  ClassSchedule copyWith({
    String? dayName,
    String? timeSlot,
    String? roomNo,
    String? course,
    String? teacher,
  }) {
    return ClassSchedule(
      dayName: dayName ?? this.dayName,
      timeSlot: timeSlot ?? this.timeSlot,
      roomNo: roomNo ?? this.roomNo,
      course: course ?? this.course,
      teacher: teacher ?? this.teacher,
    );
  }

  @override
  String toString() {
    return 'ClassSchedule(dayName: $dayName, timeSlot: $timeSlot, roomNo: $roomNo, course: $course, teacher: $teacher)';
  }

  @override
  List<Object?> get props => [dayName, timeSlot, roomNo, course, teacher];
}
