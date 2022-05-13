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
          
            ..._selectedCourse.isEmpty
                ? [  //show add button while non is selected 
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
                    ),
                  ]
                : [
                    //todo: create chip
                    Chip(
                      backgroundColor: Colors.cyanAccent,
                      deleteIcon: const Icon(Icons.close, color: Colors.red),
                      onDeleted: () {},
                      label: Text("CSE 498"),
                    ),
                    //  select your regCourses
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
}
