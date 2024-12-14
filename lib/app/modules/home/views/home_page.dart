import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ml_flutter_project/app/data/place.dart';
import 'package:ml_flutter_project/app/data/places_data.dart';
import 'package:ml_flutter_project/app/modules/home/controllers/home_controller.dart';
import 'package:ml_flutter_project/app/widgets/place_details.dart';
import 'package:ml_flutter_project/app/widgets/places_gallery.dart';
import 'package:ml_flutter_project/app/widgets/responsive_util.dart';

class HomePage extends StatelessWidget {
  // HomeController is now used directly in the widget
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Widget widget;
    // Reactively get screen size
    switch (getScreenSize(MediaQuery.of(context).size.width)) {
      case ScreenSize.small:
        widget = homePageSmall();
        break;
      case ScreenSize.medium:
        widget = homePageMedium();
        break;
      case ScreenSize.large:
        widget = homePageLarge();
        break;
    }
    return widget;
  }

  Widget homePageSmall() {
    return Scaffold(
      drawer: Drawer(
        child: drawerBody(),
      ),
      body: PlacesGallery(handlePlaceChanged: homeController.handlePlaceChanged),
    );
  }

  Widget homePageMedium() {
    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 2, child: drawerBody()),
          Expanded(
              flex: 5,
              child: PlacesGallery(handlePlaceChanged: homeController.handlePlaceChanged)),
        ],
      ),
    );
  }

  Widget homePageLarge() {
    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 1, child: drawerBody()),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: PlacesGallery(
                          handlePlaceChanged: homeController.handlePlaceChanged,
                          showHorizontalGridView: true,
                        )),
                    Expanded(
                      flex: 2,
                      child: Obx(() {
                        // Use Obx to rebuild PlaceDetails when selectedPlace changes
                        return PlaceDetails(place: homeController.selectedPlace.value);
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      title: const Text('Places App - Responsive'),
    );
  }

  Widget drawerBody() {
    final menuItems = Places().getStatesOfSouthIndia();
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: menuItems.length + 1, // +1 for header
        itemBuilder: (context, index) {
          if (index == 0) {
            return DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage('assets/images/india_chettinad_silk_maker.png')),
              ),
              child: Container(
                alignment: AlignmentDirectional.bottomStart,
                child: const Text(
                  'Bangladesh',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            );
          } else {
            return ListTile(
                leading: const Icon(Icons.location_city),
                title: Text(menuItems[index - 1]),
                selected: index == 1 ? true : false);
          }
        });
  }
}
