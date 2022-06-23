import 'package:flutter/material.dart';

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 5, 15, 23),
      title: Text('Maps'),
      centerTitle: true,
    ));
  }
}