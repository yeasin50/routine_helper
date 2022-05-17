import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routine/routine.dart';
import 'xlsx_parser/xlsx_parser.dart';

class RoutineHelperApp extends MaterialApp {
  RoutineHelperApp({Key? key})
      : super(
          key: key,
          debugShowCheckedModeBanner: false,
          home: BlocProvider(
            create: (context) => DeptRoutineBloc(),
            child: const XlSXParserPage(),
          ),
        );
}
