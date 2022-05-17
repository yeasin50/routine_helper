import 'package:flutter/material.dart';

import '../routine.dart';



/// Delegate for [showSearch] to define the content of the search page.
/// 
class CourseSearchDelegant extends SearchDelegate {
  /// show course search screen. [intiSelectedCourse] is used for selected course
  ///
  ///selected [RegisteredCourse] will be return on [close]
  ///```
  /// ElevatedButton(
  /// onPressed: () async {
  ///   final data = await showSearch(
  ///     context: context,
  ///     delegate: CourseSearchDelegant(
  ///       intiSelectedCourse: currentSelectedCourses,
  ///     ),
  ///   );
  ///   debugPrint("got data $data");
  /// },
  /// child: const Icon(Icons.add),
  /// style: ElevatedButton.styleFrom(
  ///   shape: const CircleBorder(),
  /// )),
  ///```

  /// * pass selected courses using [intiSelectedCourse]
  CourseSearchDelegant({
    List<RegisteredCourse>? intiSelectedCourse,
  })  : selectedCourse = intiSelectedCourse ?? [],
        super();

  /// selected course from list will be return back using [close] method.
  late List<RegisteredCourse> selectedCourse;

  final List<RegisteredCourse> courses = AppData.offerCourses;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, selectedCourse),
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // search by course code and title
    final List<RegisteredCourse> filterResult = courses
        .where(
          (element) =>
              element.courseCode
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              element.courseTitle
                  .toLowerCase()
                  .contains(query.toLowerCase()),
        )
        .toList();

    return StatefulBuilder(
      builder: (context, setState) => ListView.separated(
        itemCount: filterResult.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          return CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              "${filterResult[index].courseCode} ${filterResult[index].section.name}",
            ),
            subtitle: Text(filterResult[index].courseTitle),
            value: selectedCourse.contains(filterResult[index]),
            secondary: viewCourseInfo(context, filterResult[index]),
            onChanged: (_) {
              if (selectedCourse.contains(filterResult[index])) {
                selectedCourse.remove(filterResult[index]);
              } else {
                selectedCourse.add(filterResult[index]);
              }
              setState(() {});
            },
          );
        },
      ),
    );
  }

  ///show details using dialog [CourseInfoDialog]
  ///
  ///about [RegisteredCourse] including teacher and class schedule
  IconButton viewCourseInfo(BuildContext context, RegisteredCourse course) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => CourseInfoDialog(course: course),
        );
      },
      icon: const Icon(
        Icons.info_outline_rounded,
      ),
    );
  }
}
