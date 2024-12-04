import 'dart:ui'; // For image-related functionality from Dart

import 'package:flutter/material.dart'; // Image widget from Flutter
import 'package:flutter/physics.dart';
import 'package:get/get.dart';
import 'package:ml_flutter_project/app/modules/rive_animation_modules/views/popup_view.dart';
import 'package:ml_flutter_project/app/modules/side_menu_modules/views/side_menu_modules_view.dart';
import 'package:ml_flutter_project/app/share/theme.dart';
import 'package:rive/rive.dart'; // Rive animation package

import 'package:flutter/widgets.dart'
as flutter_image; // Alias for Flutter Image

class RiveAnimationModulesView extends StatefulWidget {
  const RiveAnimationModulesView({super.key});

  @override
  State<RiveAnimationModulesView> createState() =>
      _RiveAnimationModulesViewState();
}

class _RiveAnimationModulesViewState extends State<RiveAnimationModulesView>
    with TickerProviderStateMixin {
  final Widget _tabBody = Container(
    color: RiverAppTheme.background,
  );
  late SMIBool? _menuBtn;
  late RiveAnimationController _btnController;
  AnimationController? _popupAnimController;
  AnimationController?_animationController;
  late Animation<double> _slideBarAnim;
  static const springDesc =
  SpringDescription(mass: 0.1, stiffness: 40, damping: 5);

  // void _onMenuIconInit(Artboard artboard) {
  //   final controller = StateMachineController.fromArtboard(
  //       artboard, "State Machine");
  //   artboard.addController(controller!);
  //   _menuBtn = controller.findInput<bool>("isOpen") as SMIBool;
  //   _menuBtn.value = true;
  // }
  /// Initialize the Rive menu animation
  void _onMenuIconInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
        artboard, "State Machine");
    if (controller == null) {
      print("Error: State machine not found in the Rive asset.");
      return;
    }
    artboard.addController(controller);
    _menuBtn = controller.findInput<bool>("isOpen") as SMIBool?;
    if (_menuBtn != null) {
      _menuBtn?.value = true; // Default state
    }
  }
  /// Handle menu press
  void onMenuPress() {
    if (_menuBtn == null) {
      print("Error: Rive state machine is not initialized.");
      return;
    }
    if (_menuBtn?.value ?? false) {
      final springAnim = SpringSimulation(springDesc, 0, 1, 0);
      _animationController?.animateWith(springAnim);
    }
    _menuBtn?.value = !(_menuBtn?.value ?? false); // Toggle state
  }

  @override
  void initState() {

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 200), upperBound: 1,
        vsync: this

    );
    _slideBarAnim = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController!, curve: Curves.linear));
    _btnController = OneShotAnimation("active", autoplay: false);
    _btnController.isActiveChanged.addListener(() {
      if (!_btnController.isActive) {
        final springAnim = SpringSimulation(springDesc, 0, 1, 0);
        _popupAnimController?.animateWith(springAnim);
      }
    });
    _popupAnimController = AnimationController(
        duration: const Duration(milliseconds: 350),
        upperBound: 1,
        vsync: this);
  }

  @override
  void dispose() {
    _btnController.dispose();
    _popupAnimController?.dispose();
    _animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SideMenuModulesView(),
          AnimatedBuilder(animation: _slideBarAnim,
              builder: (BuildContext context, Widget? child) {
                return Transform.translate(
                    offset: Offset(_slideBarAnim.value*265,0),child: child!);
              },
              child: _tabBody),
          SafeArea(
            child: GestureDetector(
              onTap: onMenuPress,
              child: Container(
                width: 44,
                height: 44,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: RiverAppTheme.shadow.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(0, 5))
                ]),
                child: RiveAnimation.asset(
                  'assets/rive_app/rive/menu_button.riv',
                  stateMachines: const ["State Machine"],
                  animations: const ["open", "close"],
                  onInit: _onMenuIconInit,
                ),
                // child: RiveAnimation.asset(
                //   'assets/rive_app/rive/menu_button.riv',
                //   stateMachines: const ["State Machine"], // Ensure the name matches in Rive
                //   onInit: (artboard) {
                //     final controller = StateMachineController.fromArtboard(
                //         artboard, "State Machine");
                //     if (controller == null) {
                //       debugPrint("State Machine not found in Rive asset.");
                //       return;
                //     }
                //     artboard.addController(controller);
                //
                //     // Find and initialize the "isOpen" input
                //     _menuBtn = controller.findInput<bool>("isOpen") as SMIBool?;
                //     if (_menuBtn == null) {
                //       debugPrint("SMIBool 'isOpen' not found.");
                //     } else {
                //       _menuBtn?.value = true; // Initial state
                //     }
                //   },
                // ),

              ),
            ),
          ),
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: Center(
              child: OverflowBox(
                maxWidth: double.infinity,
                child: Transform.translate(
                  offset: const Offset(200, 100),
                  child: flutter_image.Image.asset(
                    'assets/rive_app/images/backgrounds/spline.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          // Popup animation

          /// backdrawal filter apply for  blur all the widget bellow it
          /// Image filter only apply for blue on the widget provide the
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: const RiveAnimation.asset(
              'assets/rive_app/rive/shapes.riv', // Path to your Rive .riv file
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(100, 80, 40, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text widget for title with corrected width
                  const SizedBox(
                    width: 260,
                    child: Text(
                      "Learn design & code",
                      style: TextStyle(fontFamily: 'poppins', fontSize: 60),
                    ),
                  ),
                  Text(
                    "Don't skip design. Learn design & code, by building real world of Flutter",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 17),
                  ),

                  const Spacer(),
                  Container(
                    width: 236,
                    height: 64,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        // Set the shadow color with opacity
                        offset: const Offset(0, 4),
                        // Set the shadow offset (optional)
                        blurRadius: 10, // Set the blur radius (optional)
                      )
                    ]),
                    child: GestureDetector(
                        onTap: () {
                          // Play the Rive animation
                          _btnController.isActive = true;

                          // Additional logic after animation
                          // Future.delayed(const Duration(milliseconds: 700), () {
                          //   Get.to(
                          //       () => const PopUpView()); // Example navigation
                          // });
                        },
                        child: Stack(
                          children: [
                            RiveAnimation.asset(
                              'assets/rive_app/rive/button.riv',
                              controllers: [_btnController],
                              fit: BoxFit.cover,
                            ),
                            Center(
                                child: Transform.translate(
                                  offset: const Offset(4, 4),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_forward_rounded),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "Start The Journey",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),

          AnimatedBuilder(
              animation: _popupAnimController!,
              builder: (context, child) {
                /// horizontally no animation thats why 0
                /// vertically total device of height  from outside the screen that's why minus
                /// _popupAnimController!.value=0;1-0 =1;default  -screen height finally 0 will be and it will stay in center
                return Transform.translate(
                  offset: Offset(
                    0,
                    -MediaQuery
                        .of(context)
                        .size
                        .height *
                        (1 - _popupAnimController!.value),
                  ),
                  child: PopUpView(
                    closeModel: () {
                      _popupAnimController?.reverse();
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
}
///-----------------------------
// import 'dart:ui'; // For image-related functionality
// import 'package:flutter/material.dart'; // Core Flutter package
// import 'package:flutter/physics.dart';
// import 'package:get/get.dart';
// import 'package:ml_flutter_project/app/modules/rive_animation_modules/views/popup_view.dart';
// import 'package:ml_flutter_project/app/modules/side_menu_modules/views/side_menu_modules_view.dart';
// import 'package:ml_flutter_project/app/share/theme.dart';
// import 'package:rive/rive.dart'; // Rive animation package
// import 'package:flutter/widgets.dart'
// as flutter_image; // Alias for Flutter Image
// class RiveAnimationModulesView extends StatefulWidget {
//   const RiveAnimationModulesView({super.key});
//
//   @override
//   State<RiveAnimationModulesView> createState() =>
//       _RiveAnimationModulesViewState();
// }
//
// class _RiveAnimationModulesViewState extends State<RiveAnimationModulesView>
//     with TickerProviderStateMixin {
//   late SMIBool? _menuBtn;
//   late RiveAnimationController _btnController;
//   AnimationController? _popupAnimController;
//   AnimationController? _animationController;
//   late Animation<double> _slideBarAnim;
//
//   static const springDesc =
//   SpringDescription(mass: 0.1, stiffness: 40, damping: 5);
//
//   /// Initialize the Rive menu animation
//   void _onMenuIconInit(Artboard artboard) {
//     final controller = StateMachineController.fromArtboard(
//         artboard, "State Machine");
//     if (controller == null) {
//       print("Error: State machine not found in the Rive asset.");
//       return;
//     }
//     artboard.addController(controller);
//     _menuBtn = controller.findInput<bool>("isOpen") as SMIBool?;
//     if (_menuBtn != null) {
//       _menuBtn?.value = true; // Default state
//     }
//   }
//
//   /// Handle menu press
//   void onMenuPress() {
//     if (_menuBtn == null) {
//       print("Error: Rive state machine is not initialized.");
//       return;
//     }
//     if (_menuBtn?.value ?? false) {
//       final springAnim = SpringSimulation(springDesc, 0, 1, 0);
//       _animationController?.animateWith(springAnim);
//     }
//     _menuBtn?.value = !(_menuBtn?.value ?? false); // Toggle state
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 200),
//       upperBound: 1,
//       vsync: this,
//     );
//
//     _slideBarAnim = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _animationController!, curve: Curves.linear),
//     );
//
//     _btnController = OneShotAnimation("active", autoplay: false);
//     _popupAnimController = AnimationController(
//       duration: const Duration(milliseconds: 350),
//       upperBound: 1,
//       vsync: this,
//     );
//   }
//
//   @override
//   void dispose() {
//     _btnController.dispose();
//     _popupAnimController?.dispose();
//     _animationController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Side menu
//           const SideMenuModulesView(),
//
//           // Main content with slide animation
//           AnimatedBuilder(
//             animation: _slideBarAnim,
//             builder: (context, child) {
//               return Transform.translate(
//                 offset: Offset(_slideBarAnim.value * 265, 0),
//                 child: child!,
//               );
//             },
//             child: Container(color: RiverAppTheme.background),
//           ),
//
//           // Menu button with Rive animation
//           SafeArea(
//             child: GestureDetector(
//               onTap: onMenuPress,
//               child: Container(
//                 width: 44,
//                 height: 44,
//                 margin: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(boxShadow: [
//                   BoxShadow(
//                     color: RiverAppTheme.shadow.withOpacity(0.2),
//                     blurRadius: 5,
//                     offset: const Offset(0, 5),
//                   ),
//                 ]),
//                 child: RiveAnimation.asset(
//                   'assets/rive_app/rive/menu_button.riv',
//                   stateMachines: const ["State Machine"],
//                   animations: const ["open", "close"],
//                   onInit: _onMenuIconInit,
//                 ),
//               ),
//             ),
//           ),
//
//           // Background blur with spline image
//           ImageFiltered(
//             imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
//             child: Center(
//               child: OverflowBox(
//                 maxWidth: double.infinity,
//                 child: Transform.translate(
//                   offset: const Offset(200, 100),
//                   child: flutter_image.Image.asset(
//                     'assets/rive_app/images/backgrounds/spline.png',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//           // Popup animation
//           AnimatedBuilder(
//             animation: _popupAnimController!,
//             builder: (context, child) {
//               return Transform.translate(
//                 offset: Offset(
//                   0,
//                   -MediaQuery.of(context).size.height *
//                       (1 - _popupAnimController!.value),
//                 ),
//                 child: PopUpView(
//                   closeModel: () {
//                     _popupAnimController?.reverse();
//                   },
//                 ),
//               );
//             },
//           ),
//
//           // Bottom section with button
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(100, 80, 40, 40),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     width: 260,
//                     child: Text(
//                       "Learn design & code",
//                       style: TextStyle(fontFamily: 'poppins', fontSize: 60),
//                     ),
//                   ),
//                   Text(
//                     "Don't skip design. Learn design & code, by building real-world Flutter apps.",
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                       color: Colors.black.withOpacity(0.7),
//                       fontSize: 17,
//                     ),
//                   ),
//                   const Spacer(),
//                   Container(
//                     width: 236,
//                     height: 64,
//                     decoration: BoxDecoration(boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.3),
//                         offset: const Offset(0, 4),
//                         blurRadius: 10,
//                       ),
//                     ]),
//                     child: GestureDetector(
//                       onTap: () {
//                         _btnController.isActive = true;
//                         Future.delayed(const Duration(milliseconds: 700), () {
//                           Get.to(() => const PopUpView());
//                         });
//                       },
//                       child: Stack(
//                         children: [
//                           RiveAnimation.asset(
//                             'assets/rive_app/rive/button.riv',
//                             controllers: [_btnController],
//                             fit: BoxFit.cover,
//                           ),
//                           Center(
//                             child: Transform.translate(
//                               offset: const Offset(4, 4),
//                               child: const Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.arrow_forward_rounded),
//                                   SizedBox(width: 4),
//                                   Text(
//                                     "Start The Journey",
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontFamily: "Inter",
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
