import 'package:flutter/material.dart';
import 'package:responsiveapp/widget/place_details.dart';

import '../model/place.dart';

class PlaceDetailsPage extends StatelessWidget {
  final Place place;

  PlaceDetailsPage(this.place);

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
