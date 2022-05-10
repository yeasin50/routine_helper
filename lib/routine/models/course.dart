import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String courseCode;
  final String courseTitle;
  final int credit;

  const Course({
    required this.courseCode,
    required this.courseTitle,
    required this.credit,
  });

  const Course.social({
    this.courseCode = "CSE498",
    this.courseTitle = "Social and Professional Issues in Computing",
    this.credit = 3,
  });

  const Course.webEngineeringOld({
    this.courseCode = "CSE417",
    this.courseTitle = "Web Engineering",
    this.credit = 3,
  });

  const Course.webEngineeringLabOld({
    this.courseCode = "CSE418",
    this.courseTitle = "Web Engineering Lab",
    this.credit = 1,
  });

  const Course.webEngineeringNew({
    this.courseCode = "CSE414",
    this.courseTitle = "Web Engineering",
    this.credit = 2,
  });

  const Course.webEngineeringLabNew({
    this.courseCode = "CSE415",
    this.courseTitle = "Web Engineering Lab",
    this.credit = 1,
  });

  @override
  String toString() =>
      'Course(courseCode: $courseCode, courseTitle: $courseTitle, credit: $credit)';

  Course copyWith({
    String? courseCode,
    String? courseTitle,
    int? credit,
  }) {
    return Course(
      courseCode: courseCode ?? this.courseCode,
      courseTitle: courseTitle ?? this.courseTitle,
      credit: credit ?? this.credit,
    );
  }

  @override
  List<Object?> get props => [
        courseCode,
        courseTitle,
        credit,
      ];
}
