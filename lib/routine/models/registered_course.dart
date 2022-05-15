import 'package:equatable/equatable.dart';

import 'models.dart';

class RegisteredCourse extends Course with EquatableMixin {
  //try replacing with type
  final Section section;

  final Teacher? teacher;
  final List<Class> classes;

  RegisteredCourse({
    required Course course,
    required this.section,
    required this.teacher,
    required this.classes,
  }) : super(
          courseCode: course.courseCode,
          courseTitle: course.courseTitle,
          credit: course.credit,
        );

  @override
  RegisteredCourse copyWith({
    Section? section,
    Teacher? teacher,
    List<Class>? classes,
    String? courseCode,
    String? courseTitle,
    int? credit,
  }) {
    return RegisteredCourse(
      section: section ?? this.section,
      teacher: teacher ?? this.teacher,
      classes: classes ?? this.classes,
      course: Course(
        courseCode: courseCode ?? this.courseCode,
        courseTitle: courseTitle ?? this.courseTitle,
        credit: credit ?? this.credit,
      ),
    );
  }

  @override
  List<Object?> get props =>
      [section, teacher, classes, courseCode, courseTitle, credit];

  @override
  String toString() {
    return 'RegisteredCourse(section: $section, teacher: $teacher, classes: $classes, courseCode: $courseCode, courseTitle $courseTitle, credit $credit )';
  }
}
