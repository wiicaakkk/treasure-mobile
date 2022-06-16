import 'package:flutter/material.dart';


class PlaceDetail extends StatelessWidget {
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
