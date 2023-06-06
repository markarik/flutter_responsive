import 'package:flutter/material.dart';
import 'package:responsiveapp/model/place.dart';
import 'package:responsiveapp/model/places_data.dart';
import 'package:responsiveapp/widget/places_gallery.dart';

class HomePageMedium extends StatefulWidget {
  @override
  _HomePageMediumState createState() => _HomePageMediumState();
}

class _HomePageMediumState extends State<HomePageMedium> {
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
        title: Text('Medium'),
      ),
      body: Row(
        children: [
          Expanded(flex: 2, child: drawerBody()),
          Expanded(
              flex: 5,
              child: PlacesGallery(handlePlaceChanged: handlePlaceChanged)),
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