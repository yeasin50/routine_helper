import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:routine_helper/routine/data/course_info.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';

import '../routine.dart';

typedef SelectedCourse = Function(RegisteredCourse course);

class CouseSelectionTextFiled extends StatefulWidget {
  const CouseSelectionTextFiled({
    Key? key,
    required this.selectedCourse,
  }) : super(key: key);

  final SelectedCourse selectedCourse;

  @override
  State<CouseSelectionTextFiled> createState() =>
      _CouseSelectionTextFiledState();
}

class _CouseSelectionTextFiledState extends State<CouseSelectionTextFiled> {
  RegisteredCourse? _selectedCourse;

  late final TextEditingController controller = TextEditingController()
    ..addListener(() {
      setState(() {});
    });

  @override
  Widget build(BuildContext context) {
    // return TypeAheadField<RegisteredCourse>(
    //   textFieldConfiguration: TextFieldConfiguration(
    //       autofocus: true,
    //       style: DefaultTextStyle.of(context)
    //           .style
    //           .copyWith(fontStyle: FontStyle.italic),
    //       decoration: InputDecoration(border: OutlineInputBorder())),
    //   suggestionsCallback: (search) async {
    //     return Future.delayed(Duration.zero)
    //         .then((value) => AppData.offerCourses.where(
    //               (element) =>
    //                   element.course.courseTitle.toLowerCase().contains(
    //                         search.toLowerCase(),
    //                       ) ||
    //                   element.course.courseCode.toLowerCase().contains(
    //                         search.toLowerCase(),
    //                       ),
    //             ));
    //     // return await BackendService.getSuggestions(pattern);
    //   },
    //   itemBuilder: (context, suggestion) {
    //     return ListTile(
    //       leading: Icon(Icons.shopping_cart),
    //       title: Text(suggestion.course.courseTitle),
    //     );
    //   },
    //   onSuggestionSelected: (suggestion) {
    //     // Navigator.of(context).push(MaterialPageRoute(
    //     //     builder: (context) => ProductPage(product: suggestion)));
    //   },
    // );

    return simpleAutoComplete();
  }

  SimpleAutocompleteFormField<RegisteredCourse> simpleAutoComplete() {
    ///FIXME:
    return SimpleAutocompleteFormField<RegisteredCourse>(
      controller: controller,
      initialValue: _selectedCourse,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        errorText:
            (controller.text.isEmpty) ? "Enter course code or title" : null,
      ),

      onSearch: (search) async {
        return AppData.offerCourses
            .where(
              (element) =>
                  element.course.courseTitle.toLowerCase().contains(
                        search.toLowerCase(),
                      ) ||
                  element.course.courseCode.toLowerCase().contains(
                        search.toLowerCase(),
                      ),
            )
            .toList();
      },

      onChanged: (v) {
        debugPrint("onChanged ${v?.course.courseTitle}");
        setState(() {
          _selectedCourse = v;
        });
      },
      // onFieldSubmitted: (v) {
      //   debugPrint("onFieldSubmitted" + v.toString());
      // },
      // onSaved: (v) {
      //   debugPrint("onSaved" + v.toString());
      // },
      itemFromString: (str) {
        debugPrint("itemFromString" + str);
        return AppData.offerCourses.firstWhere(
          (element) => element.course.courseTitle
              .toLowerCase()
              .contains(str.toLowerCase()),
        );
      },
      itemBuilder: (context, regCourse) {
        return GestureDetector(
          onTap: () {
            debugPrint("taped");
          },
          child: ListTile(
            tileColor: Colors.cyanAccent,
            // onTap: () {
            //   if (regCourse != null) widget.selectedCourse(regCourse);
            //   log(regCourse.toString());
            // },
            title: Text(regCourse?.course.courseTitle ?? ""),
            subtitle: Text(regCourse?.course.courseCode ?? ""),
          ),
        );
      },
      maxSuggestions: 5,
    );
  }
}
