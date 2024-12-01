import 'package:flutter/material.dart';
import 'package:ml_flutter_project/app/data/place.dart';
import 'package:ml_flutter_project/app/widgets/place_details.dart';



class PlaceDetailsPage extends StatelessWidget {
  final Place place;

  const PlaceDetailsPage(this.place, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.subtitle),
        centerTitle: true,
      ),
      body: PlaceDetails(place: place),
    );
  }
}
