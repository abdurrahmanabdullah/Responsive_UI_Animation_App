// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
//
// import '../controllers/side_menu_modules_controller.dart';
//
// class SideMenuModulesView extends GetView<SideMenuModulesController> {
//   const SideMenuModulesView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('SideMenuModulesView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'SideMenuModulesView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ml_flutter_project/app/model/menu_item.dart';
import 'package:ml_flutter_project/app/share/theme.dart';
import 'package:ml_flutter_project/app/widgets/menu_row.dart';

class SideMenuModulesView extends StatefulWidget {
  const SideMenuModulesView({super.key});

  @override
  State<SideMenuModulesView> createState() => _SideMenuModulesViewState();
}

class _SideMenuModulesViewState extends State<SideMenuModulesView> {
  final List<MenuItemModel> _browseMenuIcons = MenuItemModel.menuItemList;
  final List<MenuItemModel> _historyMenuIcons = MenuItemModel.menuItems2;




  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 288),
        decoration: BoxDecoration(
          color: RiverAppTheme.background2,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          ///by default it will center that's why make it start
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    foregroundColor: Colors.white,
                    child: const Icon(Icons.person_outline),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Abdullah",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: "Inter",
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "Software Engineer",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 15,
                          fontFamily: "Inter",
                          decoration: TextDecoration.none,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MenuButtonSection(
              title: 'BROWSE',

              menuIcons: _browseMenuIcons,
            ),
            const SizedBox(
              height: 10,
            ),
            MenuButtonSection(
              title: 'HISTORY',

              menuIcons: _historyMenuIcons,
            )
          ],
        ),
      ),
    );
  }
}

