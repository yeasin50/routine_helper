import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../routine.dart';

typedef OnCourseSelectionChange = void Function(
    List<RegisteredCourse> selectedCourse);

class CourseSelectionView extends StatefulWidget {
  const CourseSelectionView({
    Key? key,
    required this.onCourseSelectionChange,
    this.useSearchDialog = false,
  }) : super(key: key);

  /// show select course using search dialog for large number of courses,
  /// else use selectable choice chip.
  ///
  /// default [userSearchDialog] is false for better judgement for old syll
  final bool useSearchDialog;

  final OnCourseSelectionChange onCourseSelectionChange;

  @override
  State<CourseSelectionView> createState() => _CourseSelectionViewState();
}

class _CourseSelectionViewState extends State<CourseSelectionView> {
  List<RegisteredCourse> _selectedCourse = [];

  void _searchCourse() async {
    final data = await showSearch(
      context: context,
      delegate: CourseSearchDelegant(
        intiSelectedCourse: _selectedCourse,
      ),
    );
    // debugPrint("got data $data");
    _addCourses(data);
  }

  void _addCourses(List<RegisteredCourse> courses) {
    setState(() {
      _selectedCourse = courses;
    });
    widget.onCourseSelectionChange(_selectedCourse);
  }

  /// remove selected on chip-cross tap
  void _removeRegisteredCourse(RegisteredCourse course) {
    _selectedCourse.remove(course);
    widget.onCourseSelectionChange(_selectedCourse);
    setState(() {});
  }

  void _onSelected(bool v, RegisteredCourse course) {
    !_selectedCourse.contains(course)
        ? _addCourses([..._selectedCourse, course])
        : _removeRegisteredCourse(course);
  }

  @override
  void initState() {
    super.initState();
    _selectedCourse = AppData.myCourse;
  }

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      blur: 1,
      opacity: .4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.useSearchDialog ? searchDialog() : selectableChoiceChip(),
      ),
    );
  }

  Wrap selectableChoiceChip() {
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 10,
      spacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <RegisteredCourse>{...AppData.offerCourses, ...AppData.myCourse}
          .map(
            (course) => ChoiceChip(
              selectedColor: course.color,
              label: Text("${course.courseCode} ${course.section.name}"),
              selected: _selectedCourse.contains(course),
              onSelected: (v) => _onSelected(v, course),
            ),
          )
          .toList(),
    );
  }

  Wrap searchDialog() {
    return Wrap(
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
    );
  }

  ///chip generated from `_selectedCourse` List
  List<Chip> _buildSelectedRegCourseChip() => _selectedCourse
      .map(
        (course) => Chip(
          backgroundColor: course.color,
          deleteIcon: const Icon(Icons.close, color: Colors.red),
          onDeleted: () => _removeRegisteredCourse(course),
          label: Text("${course.courseCode} ${course.section.name}"),
        ),
      )
      .toList();
}
