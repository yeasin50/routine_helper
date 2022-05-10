import 'package:equatable/equatable.dart';

import 'models.dart';

class RegisteredCourse extends Equatable {
  //try replacing with type
  final Section section;

  final Teacher? teacher;
  final List<Class> classes;
  final Course course;

  const RegisteredCourse({
    required this.course,
    required this.section,
    required this.teacher,
    required this.classes,
  });

  @override
  List<Object?> get props => [
        section,
        teacher,
        classes,
      ];

  RegisteredCourse copyWith({
    Section? section,
    Teacher? teacher,
    List<Class>? classes,
    Course? course,
  }) {
    return RegisteredCourse(
      section: section ?? this.section,
      teacher: teacher ?? this.teacher,
      classes: classes ?? this.classes,
      course: course ?? this.course,
    );
  }

  @override
  String toString() {
    return 'RegisteredCourse(section: $section, teacher: $teacher, classes: $classes, course: $course)';
  }
}
