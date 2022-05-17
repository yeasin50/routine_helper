import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'xlsx_parser.dart';

class XlSXParserPage extends StatelessWidget {
  const XlSXParserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Class_Routine_Spring_2022.xlsx"),
        ),
        body: BlocBuilder<DeptRoutineBloc, DeptRoutineState>(
          bloc: DeptRoutineBloc()..add(RoutineGenerateEvent()),
          builder: (context, state) {
            switch (state.processState) {
              case FilePerserState.started:
                return const Text("file parser started");

              case FilePerserState.success:
                final classes = state.routine!.clsses;
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: classes.length,
                  itemBuilder: (c, index) {
                    debugPrint("total class S ${classes.length}");
                    final cls = classes[index];

                    final _text = "${cls.roomNo} ${cls.course} ${cls.teacher} ";
                    return ListTile(
                      leading: Text(cls.dayName),
                      title: ColoredBox(
                          color: Colors.cyanAccent.withOpacity(.3),
                          child: Text(_text)),
                      trailing: Text(cls.timeSlot),
                    );
                  },
                );
              default:
                return Text("f");
            }
          },
        )

        // futureBuilder(),
        );
  }

  FutureBuilder<DepartmentRoutine> futureBuilder() {
    return FutureBuilder<DepartmentRoutine>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: snapshot.data?.clsses.length ?? 0,
            itemBuilder: (c, index) {
              debugPrint("total class S ${snapshot.data?.clsses.length}");
              final cls = snapshot.data!.clsses[index];

              final _text = "${cls.roomNo} ${cls.course} ${cls.teacher} ";
              return ListTile(
                leading: Text(cls.dayName),
                title: ColoredBox(
                    color: Colors.cyanAccent.withOpacity(.3),
                    child: Text(_text)),
                trailing: Text(cls.timeSlot),
              );
            },
          );
        }

        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
