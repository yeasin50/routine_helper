import 'package:flutter/material.dart';

import 'routine/routine.dart';
import 'xlsx_parser/xlsx_parser.dart';

class RoutineHelperApp extends MaterialApp {
  const RoutineHelperApp({Key? key})
      : super(
          key: key,
          debugShowCheckedModeBanner: false,
          home: const XlSXParserPage(),
        );
}
