import 'package:get/get.dart';

import '../controllers/rive_animation_modules_controller.dart';

class RiveAnimationModulesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiveAnimationModulesController>(
      () => RiveAnimationModulesController(),
    );
  }
}
