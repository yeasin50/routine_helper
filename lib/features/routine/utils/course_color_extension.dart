import 'package:flutter/material.dart';
import 'package:routine_helper/features/routine/routine.dart';

import '../../../core/core.dart';

extension RegCourseExtension on RegisteredCourse {
  Color get color {
    if (courseTitle == const Course.social().courseTitle) {
      return AppColor.social;
    } else if (courseTitle == const Course.webEngineeringLabOld().courseTitle) {
      return AppColor.webLab;
    } else if (courseTitle == const Course.webEngineeringNew().courseTitle) {
      return AppColor.web;
    }
    return Colors.grey;
  }
}
