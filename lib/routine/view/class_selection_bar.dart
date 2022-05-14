import 'package:flutter/material.dart';
import 'package:routine_helper/routine/models/models.dart';

import '../../widgets/widgets.dart';
import '../widgets/widgets.dart';

class ClassSelectionView extends StatefulWidget {
  const ClassSelectionView({Key? key}) : super(key: key);

  @override
  State<ClassSelectionView> createState() => _ClassSelectionViewState();
}

class _ClassSelectionViewState extends State<ClassSelectionView> {
  List<RegisteredCourse> _selectedCourse = [];

  void _searchCourse() async {
    final data = await showSearch(
      context: context,
      delegate: CourseSearchDelegant(
        intiSelectedCourse: _selectedCourse,
      ),
    );
    debugPrint("got data $data");
    setState(() {
      _selectedCourse = data;
    });
  }

  /// remove selected on chip-cross tap
  void _removeRegisteredCourse(RegisteredCourse course) {
    _selectedCourse.remove(course);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      blur: 1,
      opacity: .4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 10,
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            //show add button while non is selected
            if (_selectedCourse.isEmpty)
              ChoiceChip(
                selected: true,
                selectedColor: Colors.deepPurple,
                avatar: const Material(
                    color: Colors.blue,
                    shape: CircleBorder(),
                    child: Icon(Icons.add, color: Colors.white)),
                label: const Text(
                  "Select Course",
                  style: TextStyle(color: Colors.white),
                ),
                onSelected: (v) => _searchCourse(),
              )
            else ...[
              //show selected course
              ..._buildSelectedRegCourseChip(),
              //  append `_selectedCourse` list
              ElevatedButton(
                onPressed: _searchCourse,
                child: const Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  ///chip generated from `_selectedCourse` List
  List<Chip> _buildSelectedRegCourseChip() => _selectedCourse
      .map(
        (course) => Chip(
          backgroundColor: Colors.cyanAccent,
          deleteIcon: const Icon(Icons.close, color: Colors.red),
          onDeleted: () => _removeRegisteredCourse(course),
          label: Text("${course.course.courseCode} ${course.section.name}"),
        ),
      )
      .toList();
}
