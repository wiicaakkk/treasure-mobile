import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home_page.dart';
import 'place_detail.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  final String url = 'http://10.0.2.2:8000/api/places';

  Future getPlaces() async {
    var response = await http.get(Uri.parse(url));
    // print(json.decode(response.body));
    return json.decode(response.body);
  }

  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Treasure'),
          centerTitle: true,
          elevation: 4.0,
          backgroundColor: Color.fromARGB(255, 5, 15, 23),
          actions: [
            IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                })
          ],
        ),
        body: FutureBuilder(
            future: getPlaces(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: (snapshot.data as dynamic)['data'].length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 110,
                        child: Card(
                          elevation: 3,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlaceDetail(place: (snapshot.data as dynamic)['data'][index],)));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  height: 150,
                                  width: 150,
                                  child: ClipRRect (
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network((snapshot.data
                                        as dynamic)['data'][index]['image']),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      (snapshot.data as dynamic)['data'][index]
                                          ['name'],
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    // Expanded(child: Text((snapshot.data as dynamic) ['data'][index]['description'],style: TextStyle(fontSize: 15), maxLines: 10, overflow: TextOverflow.ellipsis,)),
                                    // Text((snapshot.data as dynamic) ['data'][index]['price']),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Text('data error');
              }
            }));
  }
}
