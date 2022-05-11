import 'package:flutter/material.dart';

import 'view.dart';

class RoutinePage extends StatelessWidget {
  const RoutinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          ClassSelectionView(),
          ClassScheduleView(),
        ],
      ),
    );
  }
}
