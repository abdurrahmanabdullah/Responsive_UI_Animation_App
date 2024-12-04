import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ml_flutter_project/app/model/menu_item.dart';
import 'package:rive/rive.dart';

class MenuRow extends StatelessWidget {
  const MenuRow({super.key, required this.menu,});
  final MenuItemModel menu;


  void onMenuPressed() {}

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          // width: selectMenu ==menu.title?288 -16 :0,
            height: 56,
            // decoration: const BoxDecoration(color: Colors.blue),
            duration: const Duration(milliseconds: 300)),
        CupertinoButton(
          pressedOpacity: 1,
          onPressed: onMenuPressed,
          child: Row(
            children: [
              SizedBox(
                width: 32,
                height: 32,
                child: Opacity(
                  opacity: 0.6,
                  child: RiveAnimation.asset(
                    'assets/rive_app/rive/icons.riv',
                    stateMachines: [menu.riveIcon.stateMachine],
                    artboard: menu.riveIcon.artboard,
                  ),
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Text(
                menu.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  fontFamily: "Inter",
                  decoration: TextDecoration.none,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
class MenuButtonSection extends StatelessWidget {
  const MenuButtonSection({super.key, required this.title, required this.menuIcons,});
final String title;

final List <MenuItemModel>menuIcons;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 15,bottom: 8),
          child: Text(
           title,
            style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 15,
                fontFamily: "Inter",
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w600),
          ),
        ),
        for(var menu in menuIcons ) ...[///Dynamic list generation with a spread operator (when combined with ...).
          Container(
            margin: const EdgeInsets.all(2),
            child: Column(
              children: [
                Divider(color: Colors.white.withOpacity(0.1),
                  thickness: 1,
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                ),
              ],
            ),
          ),
          MenuRow(menu: menu,)]
      ],
    );
  }
}

