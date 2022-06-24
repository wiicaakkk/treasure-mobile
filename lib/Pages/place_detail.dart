import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class PlaceDetail extends StatelessWidget {
  // final String url = 'http://10.0.2.2:8000/api/places';

  // Future getPlaces() async {
  //   var response = await http.get(Uri.parse(url));
  //   // print(json.decode(response.body));
  //   return json.decode(response.body);
  // }

  // // ignore: unused_element
  // void _incrementCounter() {}

  final Map place;

  PlaceDetail({required this.place});

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width*1;
    return Scaffold(
      appBar: AppBar(
         title: Text('Place'),
          centerTitle: true,
          elevation: 4.0,
          backgroundColor: Color.fromARGB(255, 5, 15, 23),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                  }),
            )
          ],
      ),
      body: Column(
        children: [
          Container(
            child: Image.network(place['image']),
          ),
          SizedBox(
              height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            width: c_width,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: (
                    Text(place['description'], style: TextStyle(fontSize: 15),maxLines: 30,)
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
