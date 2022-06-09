import 'package:flutter/material.dart';

import '../routine.dart';

class RoutinePage extends StatefulWidget {
  const RoutinePage({Key? key}) : super(key: key);

  @override
  State<RoutinePage> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage>
    with SingleTickerProviderStateMixin {
  SemesterSchedule semesterSchedule = SemesterSchedule(
      regCourses: [], routineVersion: "x.x", semesterName: "Test");

  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );
  late Animation<double> animation =
      Tween<double>(begin: 0, end: 1).animate(controller);

  bool useSearchDialog = false;

  void _onSearchTap() {
    setState(() {
      useSearchDialog = !useSearchDialog;
    });

    if (useSearchDialog)
      controller.forward();
    else
      controller.reverse();
  }

  @override
  void initState() {
    super.initState();
    semesterSchedule = semesterSchedule.copyWith(classes: AppData.myCourse);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.4),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kToolbarHeight),
                bottomLeft: Radius.circular(kToolbarHeight),
              ),
            ),
            child: InkWell(
              onTap: _onSearchTap,
              splashColor: Colors.amber,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kToolbarHeight),
                bottomLeft: Radius.circular(kToolbarHeight),
              ),
              child: Container(
                width: kToolbarHeight * 1.2,
                alignment: Alignment.center,
                child: AnimatedIcon(
                  icon: AnimatedIcons.search_ellipsis,
                  color: Colors.purple,
                  progress: animation,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              CourseSelectionView(
                useSearchDialog: useSearchDialog,
                onCourseSelectionChange: (selectedCourse) {
                  semesterSchedule =
                      semesterSchedule.copyWith(classes: selectedCourse);
                  setState(() {});
                },
              ),
              SemesterScheduleView(
                semesterSchedule: semesterSchedule,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
