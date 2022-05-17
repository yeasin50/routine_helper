import 'package:flutter/material.dart';
import 'package:routine_helper/xlsx_parser/xlsx_parser.dart';

import 'models/dept_routine.dart';
import 'utils/read_xlsx_file.dart';

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
      body: FutureBuilder<DepartmentRoutine>(
        future: fileReading(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: snapshot.data?.clsses.length ?? 0,
                itemBuilder: (c, index) {
                  final cls = snapshot.data!.clsses[index];

                  final _text = "${cls.roomNo} ${cls.course} ${cls.teacher} ";
                  return ListTile(
                    title: Text(_text),
                  );
                });
          }

          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
