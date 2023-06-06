
import 'package:flutter/material.dart';
import 'package:responsiveapp/model/place.dart';
import 'package:responsiveapp/model/places_data.dart';
import 'package:responsiveapp/widget/place_details.dart';
import 'package:responsiveapp/widget/places_gallery.dart';

class HomePageLarge extends StatefulWidget {
  @override
  _HomePageLargeState createState() => _HomePageLargeState();
}

class _HomePageLargeState extends State<HomePageLarge> {
   Place selectedPlace = Places().getPlaces()[0];
  void handlePlaceChanged(Place newPlace) {
    setState(() {
      selectedPlace = newPlace;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Large'),
      ),
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
                            handlePlaceChanged: handlePlaceChanged,
                            showHorizontalGridView: true)),
                    Expanded(flex: 2, child: PlaceDetails(place: selectedPlace))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      
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
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage(
                        'assets/images/india_chettinad_silk_maker.png')),
              ),
              child: Container(
                alignment: AlignmentDirectional.bottomStart,
                child: Text(
                  'South India',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            );
          } else {
            return ListTile(
                leading: Icon(Icons.location_city),
                title: Text(menuItems[index - 1]),
                selected: index == 4 ? true : false);
          }
        });
  }
}