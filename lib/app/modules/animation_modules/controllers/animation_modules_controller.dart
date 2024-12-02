import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class AnimationModulesController extends GetxController {
 // 0.0=>0 degree
 // 0.5=>180 degree
 // 1.0=360 degrees
late AnimationController _controller;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
