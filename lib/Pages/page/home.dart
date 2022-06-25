// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:treasure/config/palette.dart';
import '../profile.dart';
import '../place_detail.dart';

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

  // ignore: unused_element
  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: Container(
        //   color: const Color.fromARGB(255, 5, 15, 23),
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        //     child: GNav(
        //       backgroundColor: const Color.fromARGB(255, 5, 15, 23),
        //       color: Colors.white,
        //       activeColor: Colors.white,
        //       tabBackgroundColor: Colors.grey,
        //       gap: 8,
        //       padding: EdgeInsets.all(16),
        //       tabs: const [
        //         GButton(
        //           icon: Icons.home,
        //           text: 'Home',
        //         ),
        //         GButton(
        //           icon: Icons.favorite_border,
        //           text: 'Favorite',
        //         ),
        //         GButton(
        //           icon: Icons.search,
        //           text: 'Search',
        //         ),
        //         GButton(
        //           icon: Icons.map,
        //           text: 'Maps',
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        appBar: AppBar(
          title: const Text('Treasure'),
          centerTitle: true,
          elevation: 4.0,
          backgroundColor: const Color.fromARGB(255, 5, 15, 23),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }),
            )
          ],
        ),
        body: FutureBuilder(
            future: getPlaces(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: (snapshot.data as dynamic)['data'].length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 120,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 3,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlaceDetail(
                                                place: (snapshot.data
                                                    as dynamic)['data'][index],
                                              )));
                                },
                                child: ClipRRect(
                                  child: Image.network(
                                    (snapshot.data as dynamic)['data'][index]
                                        ['image'],
                                    fit: BoxFit.cover,
                                    height: 175,
                                    width: 140,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 175,
                                  padding: const EdgeInsets.all(17),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (snapshot.data as dynamic)['data']
                                            [index]['name'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const Text('Waiting time: 2hrs'),
                                      Text(
                                        'Closes at 10PM',
                                        style: TextStyle(
                                            color: Colors.redAccent[100]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Center(
                  child: Container(
                    color: Colors.white,
                    // ignore: sort_child_properties_last
                    child: CircularProgressIndicator(
                      color: Palette.kToDark,
                    ),
                    alignment: const Alignment(0.0, 0.0),
                  ),
                );
              }
            }
      )
    );
  }
}
