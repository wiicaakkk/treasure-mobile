// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:treasure/models/post.dart';


// class FetchPost {
//   var data = [];
//   List<Post> results = [];
//   String urlList = 'http://10.0.2.2:8000/api/places';

//   Future<List<Post>> getPost({String? query}) async {
//     var url = Uri.parse(urlList);
//     try {
//       var response = await http.get(url);
//       if (response.statusCode == 200) {
      
//         data = json.decode(response.body);
//         results = data.map((e) => Post.fromJson(e)).toList();
//         if (query!= null){
//           results = results.where((element) => element.name!.toLowerCase().contains((query.toLowerCase()))).toList();
//         }
//       } else {
//         print("fetch error");
//       }
//     } on Exception catch (e) {
//       print('error: $e');
//     }
//     return results;
//   }
// }