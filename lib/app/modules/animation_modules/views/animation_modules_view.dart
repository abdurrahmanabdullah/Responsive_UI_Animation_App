import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:math';

enum CircleSide { left, right }

extension ToPath on CircleSide {
  ///The method generates a Path that represents the half-circle corresponding to the CircleSide value (either left or right).
  Path toPath(Size size) {
    var path = Path();
    late Offset offset;
    late bool clockwise;
    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }
    path.arcToPoint(
      offset,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      clockwise: clockwise,
    );
    path.close();
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;

  const HalfCircleClipper({required this.side});

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

extension on VoidCallback {
  /// a function that takes no arguments and returns void.
  /// without modifying the original class or type itself that's why use extension on
  Future<void> delayed(Duration duration) => Future.delayed(duration, this);
}

class AnimationModulesView extends StatefulWidget {
  const AnimationModulesView({super.key});

  @override
  _AnimationModulesViewState createState() => _AnimationModulesViewState();
}

class _AnimationModulesViewState extends State<AnimationModulesView>
    with TickerProviderStateMixin {
  ///SingleTickerProviderStateMixin=>this is used when I use one animation
  late AnimationController controller;
  late Animation<double> animation;
  late AnimationController _counterClockWiseRotationController;
  late Animation<double> _counterClockwiseRotationAnimation;
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _counterClockWiseRotationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _counterClockwiseRotationAnimation = Tween<double>(
      begin: 0,
      end: -(pi / 2),
    ).animate(CurvedAnimation(
        parent: _counterClockWiseRotationController,
        curve: Curves.bounceInOut));

    animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(controller);
    controller.repeat();

    ///---flip animation
    _flipController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _flipAnimation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(
        CurvedAnimation(parent: _flipController, curve: Curves.bounceOut));
    _counterClockWiseRotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _flipAnimation = Tween<double>(
          begin: _flipAnimation.value,
          end: _flipAnimation.value + pi,
        ).animate(CurvedAnimation(
            parent: _flipController, curve: Curves.bounceInOut));
        _flipController
          ..reset()
          ..forward();
      }
    });

    ///----
    _flipController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _counterClockwiseRotationAnimation = Tween<double>(
          begin: _counterClockwiseRotationAnimation.value,
          end: _counterClockwiseRotationAnimation.value + -(pi / 2),
        ).animate(CurvedAnimation(
            parent: _counterClockWiseRotationController,
            curve: Curves.bounceOut));
        _counterClockWiseRotationController
          ..reset()
          ..forward();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _counterClockWiseRotationController.dispose();
    _flipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _counterClockWiseRotationController
      ..reset()
      ..forward.delayed(const Duration(seconds: 1));

    /// reset () means start from 0

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animation '),
          centerTitle: true,
        ),
        body: Row(
          children: [
            Center(
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(animation.value),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),

            ///------------second rounded  circle animation part
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedBuilder(
                animation: _counterClockWiseRotationController,
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..rotateZ(_counterClockwiseRotationAnimation.value),
                    child: Row(
                      children: [
                        AnimatedBuilder(
                          builder: (context, child) {
                            return Transform(
                              alignment: Alignment.centerRight,
                              transform: Matrix4.identity()
                                ..rotateY(_flipAnimation.value),
                              child: ClipPath(
                                clipper: const HalfCircleClipper(
                                    side: CircleSide.left),
                                child: Container(
                                  color: Colors.blue,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            );
                          },
                          animation: _flipController,
                        ),
                        AnimatedBuilder(
                            animation: _flipAnimation,
                            builder: (context, child) {
                              return Transform(
                                alignment: Alignment.centerLeft,
                                transform: Matrix4.identity()
                                  ..rotateY(_flipAnimation.value),
                                child: ClipPath(
                                  clipper: const HalfCircleClipper(
                                      side: CircleSide.right),
                                  child: Container(
                                    color: Colors.purple,
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
