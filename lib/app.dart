import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/routine/routine.dart';
import 'features/xlsx_parser/xlsx_parser.dart';

class RoutineHelperApp extends MaterialApp {
  const RoutineHelperApp({Key? key})
      : super(
          key: key,
          debugShowCheckedModeBanner: false,
          home: const RoutinePage(),
        );
}

class _PerserPage extends StatelessWidget {
  const _PerserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeptRoutineBloc(),
      child: const XlSXParserPage(),
    );
  }
}
