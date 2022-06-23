// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:treasure/Pages/favorite.dart';
import 'package:treasure/Pages/home.dart';
import 'package:treasure/Pages/maps.dart';
import 'package:treasure/Pages/search.dart';

class Home_Page extends StatefulWidget {
  Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    Home(),
    Favorite(),
    Search(),
    Maps(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.map_sharp), label: 'Maps'),
        ],
      ),
    );
  }
}
