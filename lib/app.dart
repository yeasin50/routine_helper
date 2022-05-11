import 'package:flutter/material.dart';

import 'routine/routine.dart';

class RoutineHelperApp extends MaterialApp {
  const RoutineHelperApp({Key? key})
      : super(
          key: key,
          debugShowCheckedModeBanner: false,
          home: const RoutinePage(),
        );
}
