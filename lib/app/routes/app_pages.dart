import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ml_flutter_project/app/modules/home/views/place_details_page.dart';
import 'package:ml_flutter_project/app/modules/home/views/home_page.dart';
import 'package:ml_flutter_project/app/modules/home/views/mySplash_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const Splash = Routes.Splash;
  static const INITIAL = Routes.HOME;
  static const PlaceDetailsPage = Routes.PlaceDetailsPage;

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
    // Don't use Get.arguments directly here. Just return the page.
    // GetPage(
    //   name: _Paths.PlaceDetailsPage,
    //   page: () => PlaceDetailsPage(),  // Simply navigate without passing arguments here.
    //   binding: HomeBinding(),
    // ),
  ];
}
