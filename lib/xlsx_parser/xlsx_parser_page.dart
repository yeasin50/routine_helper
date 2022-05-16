import 'package:flutter/material.dart';

import 'utils/utils.dart';

class XlSXParserPage extends StatelessWidget {
  const XlSXParserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class_Routine_Spring_2022.xlsx"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
       await fileReading();
      }),
      body: Column(
        children: [],
      ),
    );
  }
}
