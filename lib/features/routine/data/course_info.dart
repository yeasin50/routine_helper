import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../models/models.dart';

import 'data.dart';

//todo: duplicate for Old syll

///T3_PCA Social class v.4
final _socialPCA = RegisteredCourse(
  course: const Course.social(),
  section: T3_PCA(),
  teacher: TeacherInfo.nazninSultana,
  classes: const [
    Class.t11_30(
      dayName: Weekday.Sunday,
      place: "AB04-304",
    ),
    Class.t11_30(
      dayName: Weekday.Monday,
      place: "AB04-304",
    ),
    Class(
      startTime: TimeOfDay(hour: 1, minute: 0),
      endTime: TimeOfDay(hour: 2, minute: 30),
      dayName: Weekday.Tuesday,
      place: "online-203",
    ),
    Class.t10(
      dayName: Weekday.Wednesday,
      place: "AB04-304",
    ),
  ],
);

final _socialPCB = RegisteredCourse(
  course: const Course.social(),
  section: T3_PCB(),
  teacher: TeacherInfo.nazninSultana,
  classes: const [
    Class.t10(
      dayName: Weekday.Sunday,
      place: "AB04-304",
    ),
    Class.t10(
      dayName: Weekday.Monday,
      place: "AB04-305",
    ),
    Class.t10(
      dayName: Weekday.Tuesday,
      place: "online",
    ),
    Class.t11_30(
      dayName: Weekday.Wednesday,
      place: "AB04-304",
    ),
  ],
);
final _socialPCC = RegisteredCourse(
  course: const Course.social(),
  section: T3_PCC(),
  teacher: TeacherInfo.un,
  classes: const [
    Class.t11_30(
      dayName: Weekday.Sunday,
      place: "AB04-208",
    ),
    Class(
      startTime: TimeOfDay(hour: 02, minute: 30),
      endTime: TimeOfDay(hour: 04, minute: 0),
      dayName: Weekday.Sunday,
      place: "AB04-208",
    ),
    Class(
      startTime: TimeOfDay(hour: 02, minute: 30),
      endTime: TimeOfDay(hour: 04, minute: 0),
      dayName: Weekday.Monday,
      place: "AB04-219",
    ),
    Class.t11_30(
      dayName: Weekday.Wednesday,
      place: "AB04-220",
    ),
  ],
);

// final _socialPCB =  RegisteredCourse(course: course, section: section, teacher: teacher, classes: classes)
///* PC old v4
final _webPCA = RegisteredCourse(
  course: const Course.webEngineeringOld(),
  section: PCA(),
  teacher: TeacherInfo.mayenUddinUojumdar,
  classes: const [
    Class(
      dayName: Weekday.Tuesday,
      startTime: TimeOfDay(hour: 11, minute: 30),
      endTime: TimeOfDay(hour: 14, minute: 30),
      place: "AB04-202",
    )
  ],
);

///* PC-B web
final _webPCB = RegisteredCourse(
  course: const Course.webEngineeringNew(),
  section: PCB(),
  teacher: TeacherInfo.nasrinIslamBithi,
  classes: const [
    Class.t11_30(
      dayName: Weekday.Tuesday,
      place: "AB04-221",
    ),
    Class.t11_30(
      dayName: Weekday.Thursday,
      place: "AB04-224",
    ),
  ],
);

///* PC C web
final _webPCC = RegisteredCourse(
  course: const Course.webEngineeringNew(),
  section: PCC(),
  teacher: TeacherInfo.mayenUddinUojumdar,
  classes: const [
    Class(
      dayName: Weekday.Saturday,
      startTime: TimeOfDay(hour: 13, minute: 0),
      endTime: TimeOfDay(hour: 16, minute: 00),
      place: "AB04-318(A)",
    ),
  ],
);

// v.4
final _webLabPCA = RegisteredCourse(
  course: const Course.webEngineeringLabOld(),
  section: PCA(),
  teacher: TeacherInfo.mohammadMonirulIslam,
  classes: const [
    Class(
      dayName: Weekday.Monday,
      startTime: TimeOfDay(hour: 11, minute: 30),
      endTime: TimeOfDay(hour: 14, minute: 30),
      place: "AB04-515",
    ),
    Class(
      dayName: Weekday.Wednesday,
      startTime: TimeOfDay(hour: 11, minute: 30),
      endTime: TimeOfDay(hour: 14, minute: 30),
      place: "AB04-515",
    )
  ],
);

///* PC-B web lab :favor Raju sir
final _webLabPCB = RegisteredCourse(
  course: const Course.webEngineeringLabNew(),
  section: PCB(),
  teacher: TeacherInfo.mahfujurRahman,
  classes: const [
    Class(
      dayName: Weekday.Sunday,
      startTime: TimeOfDay(hour: 14, minute: 30),
      endTime: TimeOfDay(hour: 17, minute: 30),
      place: "AB04-513",
    ),
    Class(
      dayName: Weekday.Tuesday,
      startTime: TimeOfDay(hour: 14, minute: 30),
      endTime: TimeOfDay(hour: 17, minute: 30),
      place: "AB04-513",
    )
  ],
);

final _webLabPCC = RegisteredCourse(
  course: const Course.webEngineeringLabNew(),
  section: PCC(),
  teacher: TeacherInfo.mayenUddinUojumdar,
  classes: const [
    Class(
      dayName: Weekday.Sunday,
      startTime: TimeOfDay(hour: 11, minute: 30),
      endTime: TimeOfDay(hour: 14, minute: 30),
      place: "AB04-519",
    ),
    Class(
      dayName: Weekday.Thursday,
      startTime: TimeOfDay(hour: 8, minute: 30),
      endTime: TimeOfDay(hour: 11, minute: 30),
      place: "AB04-515",
    )
  ],
);

class AppData {
  /// my reg courses;
// //todo: Switch between section
  static List<RegisteredCourse> get offerCourses => [
        _socialPCA,
        _socialPCB,
        _socialPCC,
        _webLabPCA,
        _webPCA,
        _webLabPCB,
        _webLabPCC,
        _webPCB,
        _webPCC,
      ];
}
