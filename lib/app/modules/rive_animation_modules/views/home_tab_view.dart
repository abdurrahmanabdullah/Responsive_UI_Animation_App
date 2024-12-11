//
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
//         appBar: AppBar(title: const Text("data")),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Text(
//                   "Course",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Vcard(course: _courses[1]),
//             ],
//           ),
//         ),
//         bottomNavigationBar: const CustomTabBar(), // Your custom bottom navigation bar
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:ml_flutter_project/app/model/course_model.dart';
import 'package:ml_flutter_project/app/modules/side_menu_modules/views/side_menu_modules_view.dart';
import 'package:ml_flutter_project/app/share/theme.dart';
import 'package:ml_flutter_project/app/widgets/vcard.dart';
import 'package:rive/rive.dart';
import 'bottom_navigation_view.dart'; // Import your bottom navigation widget

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView>
    with TickerProviderStateMixin {
  final List<CourseModel> _courseSection = CourseModel.courseSections;
  final List<CourseModel> _courses = CourseModel.courses;
  late SMIBool _menuBtn;
  late AnimationController? _animationController;
  late Animation<double> _slideAnim;

  // void _onMenuIconInit(Artboard artboard) {
  //   final controller =
  //       StateMachineController.fromArtboard(artboard, "State Machine");
  //   artboard.addController(controller!);
  //   _menuBtn = controller.findInput<bool>("isOpen") as SMIBool;
  //   _menuBtn.value = true;
  // }
  //
  // void onMenuPress() {
  //   _menuBtn.change(!_menuBtn.value);
  //   print("Menu button state: ${_menuBtn.value}");
  // }
  void _onMenuIconInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, "State Machine");
    if (controller != null) {
      artboard.addController(controller);
      _menuBtn = controller.findInput<bool>("isOpen") as SMIBool;
      _menuBtn.value = false; // Initialize as closed
    }
  }

  void onMenuPress() {
    setState(() {
      _menuBtn.value = !_menuBtn.value; // Toggle menu state
      print("Menu button state: ${_menuBtn.value}");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
        vsync: this,
        upperBound: 1,
        duration: const Duration(milliseconds: 200));
    _slideAnim = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController!, curve: Curves.linear));
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        // padding: EdgeInsets.only(
        //     top: MediaQuery.of(context).padding.top + 60,
        //     bottom: MediaQuery.of(context).padding.bottom),
        child: Stack(
          children: [
            const SideMenuModulesView(),
            GestureDetector(
              onTap: onMenuPress,
              child: SafeArea(
                child: Container(
                  width: 44,
                  height: 44,
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: RiverAppTheme.shadow.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: RiveAnimation.asset(
                    'assets/rive_app/rive/menu_button.riv',
                    stateMachines: const ["State Machine"],
                    animations: const ["open", "close"],
                    onInit: _onMenuIconInit,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomTabBar(),
    );
  }
}