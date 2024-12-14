import 'package:get/get.dart';

import '../controllers/animation_modules_controller.dart';

class AnimationModulesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimationModulesController>(
      () => AnimationModulesController(),
    );
  }
}
