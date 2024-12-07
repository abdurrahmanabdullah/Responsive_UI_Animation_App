// import 'package:flutter/material.dart';
// import 'package:ml_flutter_project/app/model/course_model.dart';
// import 'package:ml_flutter_project/app/widgets/vcard.dart';
// import 'bottom_navigation_view.dart'; // Import your bottom navigation widget
//
// class HomeTabView extends StatefulWidget {
//   const HomeTabView({super.key});
//
//   @override
//   State<HomeTabView> createState() => _HomeTabViewState();
// }
//
// class _HomeTabViewState extends State<HomeTabView> {
//   final List<CourseModel> _courseSection = CourseModel.courseSections;
//   final List<CourseModel> _courses = CourseModel.courses;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//
//      body: SingleChildScrollView(
//
//        child: Column(children: [
//          Text("Course"),
//          Vcard(course: _courses[1],)
//        ],),
//      ),
//         bottomNavigationBar: const CustomTabBar(), // Your custom bottom navigation bar
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:ml_flutter_project/app/model/course_model.dart';
import 'package:ml_flutter_project/app/widgets/vcard.dart';
import 'bottom_navigation_view.dart'; // Import your bottom navigation widget

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  final List<CourseModel> _courseSection = CourseModel.courseSections;
  final List<CourseModel> _courses = CourseModel.courses;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("data")),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Course",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Vcard(course: _courses[1]),
            ],
          ),
        ),
        bottomNavigationBar: const CustomTabBar(), // Your custom bottom navigation bar
      ),
    );
  }
}