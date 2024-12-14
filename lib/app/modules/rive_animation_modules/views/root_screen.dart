import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ml_flutter_project/app/modules/rive_animation_modules/views/bottom_navigation_view.dart';
import 'package:ml_flutter_project/app/modules/rive_animation_modules/views/home_tab_view.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: HomeTabView(),
       // bottomNavigationBar: CustomTabBar(),
    );
  }
}
