
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ml_flutter_project/app/routes/app_pages.dart';

class MysplashScreenView extends StatefulWidget {
  const MysplashScreenView({super.key});

  @override
  State<MysplashScreenView> createState() => _MysplashScreenViewState();
}

class _MysplashScreenViewState extends State<MysplashScreenView> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 10), () {
      print("Direct navigation after delay.");
      Get.toNamed(AppPages.INITIAL);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/fruits.png'),
            // const Text(
            //   "Title",
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
          ],
        ),
      ),
    );
  }}
