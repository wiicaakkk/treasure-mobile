import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 5, 15, 23),
      title: Text('Maps'),
      centerTitle: true,
      ),
      body: OpenStreetMapSearchAndPick(
        center: LatLong(-6.921390784425038, 107.60615873913291),
        onPicked: (pickedData) {
          print(pickedData.latLong.latitude);
          print(pickedData.latLong.longitude);
          print(pickedData.address);
        }),
    );
  }
}
