import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kelepir/product/widgets/search_bar/search_bar.dart';

import '../../../product/constants/paddings/project_paddings.dart';

class MapHome extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MapHome> {
  GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = {}; //markers for google map
  LatLng showLocation = const LatLng(41.0082, 28.9784);
  //location to show in map
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    markers.add(Marker(
      //add marker on google map
      markerId: MarkerId(showLocation.toString()),
      position: showLocation, //position of marker
      infoWindow: const InfoWindow(
        //popup info
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    //you can add more markers here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          GoogleMap(
            //Map widget from google_maps_flutter package
            zoomControlsEnabled: false,
            zoomGesturesEnabled: true, //enable Zoom in, out on map
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: showLocation, //initial position
              zoom: 10.0, //initial zoom level
            ),
            markers: markers, //markers to show on map
            mapType: MapType.normal, //map type
            onMapCreated: (controller) {
              //method called when map is created
              setState(() {
                mapController = controller;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(ProjectPaddings.normal),
            child: search_bar(_textEditingController),
          )
        ],
      ),
    );
  }
}
