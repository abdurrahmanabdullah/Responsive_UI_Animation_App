import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ml_flutter_project/app/model/tap_item.dart';
import 'package:ml_flutter_project/app/share/theme.dart';
import 'package:rive/rive.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _selectedTab = 0;

  ///trigger the animation
  SMIBool? status;
  final List<TapItemModel> icons = TapItemModel.tapItemList;

  void _onRiveIconInit(Artboard artboard, index) {
    final controller = StateMachineController.fromArtboard(
        artboard, icons[index].stateMachine);

    if (controller == null) {
      print("Error: StateMachineController for '${icons[index].stateMachine}' not found.");
      return;
    }

    artboard.addController(controller);
    icons[index].status = controller.findInput<bool>("active") as SMIBool;

    ///findInput method attempts to locate the input within the state machine and return it
  }

  void onTabPress(int index) {
    if (icons[index].status == null) {
      // Prevent action if the status is not initialized
      print("Status for icon $index is not initialized.");
      return;
    }
    setState(() {
      _selectedTab = index;
    });
    icons[index].status!.change(true);
    Future.delayed(const Duration(seconds: 1), () {
      icons[index].status?.change(false);

      /// tell compiler ! u can sure that value is not null
      /// The ?. operator will only execute the method or access the property if the value is not null
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 8),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          // Align children at the bottom
          children: [
            // Row placed at the bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // Align the button horizontally
              children: [
                Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.9), // Blue shadow on hover
                      ),
                    ],
                  ),
                  child: Row(
                    /// this generate is A callback function is a function that is passed as an argument to another function and is executed (or "called back") at a later time.
                    children: List.generate(icons.length, (index) {
                      TapItemModel icon = icons[index];

                      return CupertinoButton(
                        padding: const EdgeInsets.all(12),
                        onPressed: () {
                          onTabPress(index);
                        },
                        child: AnimatedOpacity(
                          opacity: _selectedTab == index ? 1 : 0.5,
                          duration: const Duration(milliseconds: 200),
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top:-4,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  height: 4,
                                  width: _selectedTab==index ? 20:0,
                                  decoration: const BoxDecoration(color: RiverAppTheme.accentColor),
                                ),
                              ),
                         SizedBox(
                              height: 36,
                              width: 36,
                              child: RiveAnimation.asset(
                                "assets/rive_app/rive/icons.riv",
                                stateMachines: [icon.stateMachine],
                                artboard: icon.artboard,
                                onInit: (artboard) {
                                  _onRiveIconInit(artboard, index);
                                },
                              ),
                            ),]
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}