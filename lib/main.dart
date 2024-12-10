import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Responsive Web and Mobile App",
      initialRoute: AppPages.BOTOMNAVIGATION,
      // initialRoute: AppPages.SIDE_MENU_MODULES,
      getPages: AppPages.routes,
    ),
  );
}