import 'package:get/get.dart';

import '../controllers/side_menu_modules_controller.dart';

class SideMenuModulesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SideMenuModulesController>(
      () => SideMenuModulesController(),
    );
  }
}
