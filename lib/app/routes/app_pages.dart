import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ml_flutter_project/app/modules/rive_animation_modules/views/home_tab_view.dart';
import 'package:ml_flutter_project/app/modules/rive_animation_modules/views/home_tab_view.dart';



import '../modules/Rive_Animation_modules/bindings/rive_animation_modules_binding.dart';
import '../modules/Rive_Animation_modules/views/rive_animation_modules_view.dart';
import '../modules/animation_modules/bindings/animation_modules_binding.dart';
import '../modules/animation_modules/views/animation_modules_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_page.dart';
import '../modules/home/views/mySplash_screen_view.dart';
import '../modules/side_menu_modules/bindings/side_menu_modules_binding.dart';
import '../modules/side_menu_modules/views/side_menu_modules_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const Splash = Routes.Splash;
  static const INITIAL = Routes.HOME;
  static const PlaceDetailsPage = Routes.PlaceDetailsPage;
  static const animationpage = Routes.animationpage;
  static const rive_animationpage = Routes.rive_animationpage;
  static const SIDE_MENU_MODULES = Routes.SIDE_MENU_MODULES;
  static const BOTOMNAVIGATION = Routes.BOTOMNAVIGATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.Splash,
      page: () => const MysplashScreenView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.Splash,
      page: () => const MysplashScreenView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.animationpage,
      page: () => const AnimationModulesView(),
      binding: AnimationModulesBinding(),
    ),
    GetPage(
      name: _Paths.rive_animationpage,
      page: () => const RiveAnimationModulesView(),
      binding: RiveAnimationModulesBinding(),
    ),
    GetPage(
      name: _Paths.SIDE_MENU_MODULES,
      page: () => const SideMenuModulesView(),
      binding: SideMenuModulesBinding(),
    ),
    GetPage(
      name: _Paths.BOTOMNAVIGATION,
      page: () => const HomeTabView(),
      binding: SideMenuModulesBinding(),
    ),


  ];
}
