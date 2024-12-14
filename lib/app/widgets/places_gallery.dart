import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ml_flutter_project/app/data/place.dart';
import 'package:ml_flutter_project/app/data/places_data.dart';
import 'package:ml_flutter_project/app/modules/home/views/place_details_page.dart';
import 'package:ml_flutter_project/app/routes/app_pages.dart';
import 'package:ml_flutter_project/app/widgets/responsive_util.dart';

class PlacesGallery extends StatelessWidget {
  final handlePlaceChanged;
  final bool showHorizontalGridView;

  const PlacesGallery({
    super.key,
    required this.handlePlaceChanged,
    this.showHorizontalGridView = false,  // Default value is false (vertical grid)
  });

  @override
  Widget build(BuildContext context) {
    int itemCount;
    Axis axisDirection;

    // Logic for determining layout based on showHorizontalGridView
    if (showHorizontalGridView) {
      itemCount = 1;  // Single row gallery for horizontal scroll
      axisDirection = Axis.horizontal;
    } else {
      itemCount = 2;  // Two columns for vertical grid
      axisDirection = Axis.vertical;
    }

    return Container(
      color: Colors.grey[200],
      child: GridView.count(
        crossAxisCount: itemCount,  // Number of columns for grid view
        scrollDirection: axisDirection,  // Vertical or horizontal scrolling direction
        mainAxisSpacing: 8,  // Space between items in the main axis (vertical or horizontal)
        crossAxisSpacing: 8,  // Space between items in the cross axis (horizontal or vertical)
        padding: const EdgeInsets.all(8),
        childAspectRatio: 1 / 1.2,  // Aspect ratio for each item in the grid
        children: gridItems(),
      ),
    );
  }

  // Generate the grid items for the gallery
  List<Widget> gridItems() {
    return Places()
        .getPlaces()
        .map<Widget>((place) => _GridItem(place, handlePlaceChanged))
        .toList();
  }
}

class _GridItem extends StatelessWidget {
  const _GridItem(this.place, this.handlePlaceChanged);

  final Place place;
  final handlePlaceChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: InkWell(
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(place.title),
            subtitle: Text(place.subtitle),
          ),
          child: Ink.image(
            image: AssetImage(place.image),
            fit: BoxFit.cover,
          ),
        ),
        onTap: () {
          // Handle the tap based on screen size
          switch (getScreenSize(MediaQuery.of(context).size.width)) {
            case ScreenSize.small:
            case ScreenSize.medium:

              Get.to(() => PlaceDetailsPage(place));
              break;

            case ScreenSize.large:
              handlePlaceChanged(place);  // Send place to a callback for large screen
              break;
          }
        },
      ),
    );
  }
}
