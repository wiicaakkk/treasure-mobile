import 'package:flutter/material.dart';
// import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(45.521563, -122.677433),
    zoom: 11.5,
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
        centerTitle: true,
        elevation: 4.0,
        backgroundColor: Color.fromARGB(255, 5, 15, 23),
      ),
      // ignore: prefer_const_constructors
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
      ),
    );
  }
}


// class Maps extends StatelessWidget {
//   const Maps({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
    
//     // late GoogleMapController mapController;

//     // final LatLng _center = const LatLng(45.521563, -122.677433);

//     // void _onMapCreated(GoogleMapController controller) {
//     //   mapController = controller;
//     // }
//     static const _initialCameraPosition = CameraPosition(
//       target: LatLng(45.521563, -122.677433),
//       zoom: 11.5,
//     );

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Maps'),
//           centerTitle: true,
//           elevation: 4.0,
//           backgroundColor: Color.fromARGB(255, 5, 15, 23),
//         ),
//         body: GoogleMap(
//           // onMapCreated: _onMapCreated,
//           // initialCameraPosition: CameraPosition(
//           //   target: _center,
//           //   zoom: 11.0,
//           // ),
//           myLocationButtonEnabled: false,
//           zoomControlsEnabled: false,
//           initialCameraPosition: _initialCameraPosition,
//         ),
//       ),

//       // body: OpenStreetMapSearchAndPick(
//       //   center: LatLong(-6.921390784425038, 107.60615873913291),
//       //   onPicked: (pickedData) {
//       //     print(pickedData.latLong.latitude);
//       //     print(pickedData.latLong.longitude);
//       //     print(pickedData.address);
//       //   }),
//     );
//   }
// }
