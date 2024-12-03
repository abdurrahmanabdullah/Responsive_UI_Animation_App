import 'dart:ui'; // For image-related functionality from Dart

import 'package:flutter/material.dart'; // Image widget from Flutter
import 'package:flutter/physics.dart';
import 'package:get/get.dart';
import 'package:ml_flutter_project/app/modules/rive_animation_modules/views/popup_view.dart';
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
  late RiveAnimationController _btnController;
  AnimationController? _popupAnimController;
  static const springDesc =
      SpringDescription(mass: 0.1, stiffness: 40, damping: 5);

  @override
  void initState() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Stack(
        children: [
          // Background image with blur effect
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
              padding: const EdgeInsets.fromLTRB(40, 80, 40, 40),
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
                    -MediaQuery.of(context).size.height *
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
