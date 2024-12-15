//
// ///-------------------------
//
// import 'package:flutter/material.dart';
// import 'package:ml_flutter_project/app/model/course_model.dart';
// import 'package:ml_flutter_project/app/modules/Rive_Animation_modules/views/rive_animation_modules_view.dart';
// import 'package:ml_flutter_project/app/modules/side_menu_modules/views/side_menu_modules_view.dart';
// import 'package:ml_flutter_project/app/share/theme.dart';
// import 'package:ml_flutter_project/app/widgets/vcard.dart';
// import 'package:rive/rive.dart';
//
// class HomeTabView extends StatefulWidget {
//   const HomeTabView({super.key});
//
//   @override
//   State<HomeTabView> createState() => _HomeTabViewState();
// }
//
// class _HomeTabViewState extends State<HomeTabView>
//     with TickerProviderStateMixin {
//   final List<CourseModel> _courses = CourseModel.courses;
//   bool isTextMoved = false;
//
//   late SMIBool _menuBtn;
//   late AnimationController? _animationController;
//   late Animation<double> _slideAnim;
//   bool isDrawerOpen = false; // Tracks if the drawer is open
//   // Initialize the Rive animation and StateMachineController
//   void _onMenuIconInit(Artboard artboard) {
//     final controller =
//     StateMachineController.fromArtboard(artboard, "State Machine");
//     if (controller != null) {
//       artboard.addController(controller);
//       _menuBtn = controller.findInput<bool>("isOpen") as SMIBool;
//       _menuBtn.value = false; // Initialize as closed
//     }
//   }
//
//   // Toggle menu state and drawer
//   void onMenuPress() {
//     setState(() {
//       isDrawerOpen = !isDrawerOpen; // Toggle drawer state
//       _menuBtn.change(isDrawerOpen); // Sync with Rive animation
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//         vsync: this,
//         upperBound: 1,
//         duration: const Duration(milliseconds: 200));
//     _slideAnim = Tween<double>(begin: 0, end: 1).animate(
//         CurvedAnimation(parent: _animationController!, curve: Curves.linear));
//   }
//
//   @override
//   void dispose() {
//     _animationController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Row(
//               children: [
//
//                 // Menu button (Rive animation)
//                 GestureDetector(
//                   onTap: onMenuPress,
//                   child: Container(
//                       width: 44,
//                       height: 44,
//                       margin: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             blurRadius: 5,
//                             offset: const Offset(0, 5),
//                           ),
//                         ],
//                       ),
//                       child: RiveAnimation.asset(
//                         'assets/rive_app/rive/menu_button.riv',
//                         stateMachines: const ["State Machine"],
//                         // Ensure correct state machine name
//                         animations: const ["open", "close"],
//                         onInit: _onMenuIconInit,
//                       )
//
//                   ),
//                 ),
//                 const Spacer(),
//                 GestureDetector(
//                   onTap: (){ print("Gesture detected! Navigating...");
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const RiveAnimationModulesView()),
//                   );},
//                   child: Container(
//                     width: 44,
//                     height: 44,
//                     margin: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           blurRadius: 5,
//                           offset: const Offset(0, 5),
//                         ),
//                       ],
//                     ),
//                     child: const Icon(Icons.person_outline),
//
//                   ),
//                 ),
//
//               ],
//
//             ),
//             Column(
//               children: [
//                 Stack(
//
//                     children: [
//                       SingleChildScrollView(
//                         padding: EdgeInsets.only(
//                             top: MediaQuery.of(context).padding.top),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SingleChildScrollView(
//                               scrollDirection: Axis.horizontal,
//                               child: Row(
//                                 children: _courses
//                                     .map((coursess) => Padding(
//                                   key: coursess.id,
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Vcard(course: coursess),
//                                 ))
//                                     .toList(),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       //             // Hero animation
//                       AnimatedPositioned(
//                         duration: const Duration(milliseconds: 500),
//                         top: isTextMoved ? 30 : MediaQuery.of(context).size.height / 2,
//                         right:
//                         isTextMoved ? 70 : MediaQuery.of(context).size.width / 2 - 50,
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isTextMoved = !isTextMoved;
//                             });
//                           },
//                           child: const Hero(
//                             tag: 'textHero',
//                             child: Material(
//                               color: Colors.transparent,
//                               // Ensure transparency for the hero
//                               child: Text(
//                                 "Click me I can fly",
//                                 style:
//                                 TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
// // Drawer overlay
//                       if (isDrawerOpen)
//                         const Align(
//                           alignment: Alignment.centerLeft,
//                           child: SideMenuModulesView(),
//                         ),
//
//                     ]
//                 ),
//
//               ],
//             ),
//           ],
//         ),
//
//       ),
//     );
//   }
// }
///------------------------
///

///-------------------------

import 'package:flutter/material.dart';
import 'package:ml_flutter_project/app/model/course_model.dart';
import 'package:ml_flutter_project/app/modules/Rive_Animation_modules/views/rive_animation_modules_view.dart';
import 'package:ml_flutter_project/app/modules/side_menu_modules/views/side_menu_modules_view.dart';
import 'package:ml_flutter_project/app/share/theme.dart';
import 'package:ml_flutter_project/app/widgets/vcard.dart';
import 'package:rive/rive.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView>
    with TickerProviderStateMixin {
  final List<CourseModel> _courses = CourseModel.courses;
  bool isTextMoved = false;

  late SMIBool _menuBtn;
  late AnimationController? _animationController;
  late Animation<double> _slideAnim;
  bool isDrawerOpen = false; // Tracks if the drawer is open
  // Initialize the Rive animation and StateMachineController
  void _onMenuIconInit(Artboard artboard) {
    final controller =
    StateMachineController.fromArtboard(artboard, "State Machine");
    if (controller != null) {
      artboard.addController(controller);
      _menuBtn = controller.findInput<bool>("isOpen") as SMIBool;
      _menuBtn.value = false; // Initialize as closed
    }
  }

  // Toggle menu state and drawer
  void onMenuPress() {
    setState(() {
      isDrawerOpen = !isDrawerOpen; // Toggle drawer state
      _menuBtn.change(isDrawerOpen); // Sync with Rive animation
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        upperBound: 1,
        duration: const Duration(milliseconds: 200));
    _slideAnim = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController!, curve: Curves.linear));
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [

                // Menu button (Rive animation)
                GestureDetector(
                  onTap: onMenuPress,
                  child: Container(
                      width: 44,
                      height: 44,
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: RiveAnimation.asset(
                        'assets/rive_app/rive/menu_button.riv',
                        stateMachines: const ["State Machine"],
                        // Ensure correct state machine name
                        animations: const ["open", "close"],
                        onInit: _onMenuIconInit,
                      )

                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (){ print("Gesture detected! Navigating...");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RiveAnimationModulesView()),
                  );},
                  child: Container(
                    width: 44,
                    height: 44,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.person_outline),

                  ),
                ),

              ],

            ),
            Column(
              children: [
                Stack(

                    children: [
                      SingleChildScrollView(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: _courses
                                    .map((coursess) => Padding(
                                  key: coursess.id,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Vcard(course: coursess),
                                ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //             // Hero animation
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 500),
                        top: isTextMoved ? 30 : MediaQuery.of(context).size.height / 2,
                        right:
                        isTextMoved ? 70 : MediaQuery.of(context).size.width / 2 - 50,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isTextMoved = !isTextMoved;
                            });
                          },
                          child: const Hero(
                            tag: 'textHero',
                            child: Material(
                              color: Colors.transparent,
                              // Ensure transparency for the hero
                              child: Text(
                                "Click me I can fly",
                                style:
                                TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
// Drawer overlay
                      if (isDrawerOpen)
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: SideMenuModulesView(),
                        ),

                    ]
                ),

              ],
            ),
          ],
        ),

      ),
    );
  }
}
