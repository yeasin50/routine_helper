import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import '../widgets/widgets.dart';

class ClassSelectionView extends StatelessWidget {
  const ClassSelectionView({Key? key}) : super(key: key);

  //select  directily using section name with Course code
  void _showSectionSelectionDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return LayoutBuilder(
          builder: (context, constraints) => AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: GlassMorphism(
              blur: 1,
              opacity: .5,
              color: Colors.grey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Select Section"),
                ],
              ),
            ),
          ),
        );
      },
    );
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
            //show selected RegCourses
            const Chip(
              label: Text("CSE443"),
            ),
            //  select your regCourses
            ElevatedButton(
              onPressed: () async {
                final data = await showSearch(
                  context: context,
                  delegate: CourseSearchDelegant(),
                );
                debugPrint("got data $data");
              },
              child: const Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
