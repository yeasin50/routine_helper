import 'package:flutter/material.dart';

import '../models/models.dart';

import 'data.dart';

///PC-A Social class
final _socialPCA = RegisteredCourse(
  course: const Course.social(),
  section: PCA(),
  teacher: TeacherInfo.nazninSultana,
  classes: const [
    Class.t11_30To1(
      dayName: Weekday.Sunday,
      place: "AB04-304",
    ),
    Class.t11_30To1(
      dayName: Weekday.Monday,
      place: "AB04-304",
    ),
    Class.t11_30To1(
      dayName: Weekday.Tuesday,
      place: "AB04-304",
    ),
    Class(
      dayName: Weekday.Tuesday,
      startTime: TimeOfDay(hour: 10, minute: 0),
      endTime: TimeOfDay(hour: 11, minute: 30),
      place: "AB04-304",
    ),
  ],
);

///PC-B web lab
final _webLabPCB = RegisteredCourse(
  course: const Course.webEngineeringLabOld(),
  section: PCB(),
  teacher: TeacherInfo.mahfujurRahman,
  classes: const [
    Class(
      dayName: Weekday.Sunday,
      startTime: TimeOfDay(hour: 14, minute: 30),
      endTime: TimeOfDay(hour: 17, minute: 30),
      place: "AB04-513",
    )
  ],
);

/// web
final _webPCC = RegisteredCourse(
  course: const Course.webEngineeringNew(),
  section: PCC(),
  teacher: TeacherInfo.mayenUddinUojumdar,
  classes: const [
    Class(
      dayName: Weekday.Saturday,
      startTime: TimeOfDay(hour: 13, minute: 0),
      endTime: TimeOfDay(hour: 14, minute: 30),
      place: "AB04-217",
    ),
    Class(
      dayName: Weekday.Monday,
      startTime: TimeOfDay(hour: 14, minute: 30),
      endTime: TimeOfDay(hour: 16, minute: 0),
      place: "AB04-217",
    ),
  ],
);

final _webPCB = RegisteredCourse(
  course: const Course.webEngineeringNew(),
  section: PCB(),
  teacher: TeacherInfo.nasrinIslamBithi,
  classes: const [
    Class.t11_30To1(
      dayName: Weekday.Tuesday,
      place: "AB04-217",
    ),
    Class.t11_30To1(
      dayName: Weekday.Thursday,
      place: "AB04-221",
    ),
  ],
);

/// my reg courses;
// //todo: Switch between section
List<RegisteredCourse> courses = [
  _socialPCA,
  _webLabPCB,
  _webPCC,
];
