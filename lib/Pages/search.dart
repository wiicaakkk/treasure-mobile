import 'package:flutter/material.dart';
import 'package:treasure/models/post.dart';
import 'package:treasure/services/Api_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Post> _list = [];
  List<Post> _search = [];
  var loading = false;
  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();

    final String url = 'http://10.0.2.2:8000/api/places';

    Future getPlaces() async {
      var response = await http.get(Uri.parse(url));
      // print(json.decode(response.body));
      return json.decode(response.body);
    }

  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _list.forEach((f) {
      if (f.name.contains(text) || f.id.toString().contains(text))
        _search.add(f);
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
          centerTitle: true,
          elevation: 4.0,
          backgroundColor: Color.fromARGB(255, 5, 15, 23),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              color: Color.fromARGB(0, 5, 15, 23),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    controller: controller,
                    onChanged: onSearch,
                    decoration: InputDecoration(
                        hintText: "Search", border: InputBorder.none),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      controller.clear();
                      onSearch('');
                    },
                    icon: Icon(Icons.cancel),
                  ),
                ),
              ),
            ),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: _search.length != 0 || controller.text.isNotEmpty
                        ? ListView.builder(
                            itemCount: _search.length,
                            itemBuilder: (context, i) {
                              final b = _search[i];
                              return Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        b.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                    ],
                                  ));
                            },
                          )
                        : ListView.builder(
                            itemCount: _list.length,
                            itemBuilder: (context, i) {
                              final a = _list[i];
                              return Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        a.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                    ],
                                  ));
                            },
                          ),
                  ),
          ],
        ),
      ),
    );
  }
}



// class Search extends StatelessWidget {
//   const Search({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Post>>(
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               List<Post>? data = snapshot.data;
//               return ListView.builder(
//                   itemCount: data?.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Row(
//                         children: [
//                           Container(
//                             width: 60,
//                             height: 60,
//                             decoration: BoxDecoration(
//                               color: Colors.deepPurpleAccent,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 '${data?[index].id}',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                                 overflow: TextOverflow.clip,
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 20),
//                           Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   '${data?[index].name}',
//                                   style: TextStyle(
//                                       fontSize: 18, fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   '${data?[index].name}',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ])
//                         ],
//                       ),
//                     );
//                   });
//             });
//       }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Center(
//       child: Text('Search User'),
//     );
//   }
// }