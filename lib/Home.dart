// ignore_for_file: deprecated_member_use, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print, unnecessary_import, unused_element
import 'package:blessed_pakistan/Tabs/AddPropertyPage.dart';
import 'package:blessed_pakistan/Tabs/FavoritesPage.dart';
import 'package:blessed_pakistan/Tabs/HomePage.dart';
import 'package:blessed_pakistan/Tabs/NewsProjectsPage.dart';
import 'package:blessed_pakistan/Tabs/SearchPropertiesPage.dart';
import 'package:blessed_pakistan/drawer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'Blessed Pakistan',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String _selectedDrawerItem = ''; // Track selected drawer item
int _currentIndex = 0;

List<Color> tabColors = [
  Colors.indigoAccent.shade700, // Home
  Colors.orange, // Search
  Colors.green, // Add
  Colors.red, // Favorite
  Colors.blue, // Person
];

final List<Widget> _screens = [
  HomePageContent(),
  SearchPropertiesPage(),
  AddPropertyPage(),
  FavoritesPage(),
  NewsProjectsPage()
];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MyAppBar(title: 'Home Page'),
      drawer: MyDrawerScreen(),
      body: _screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 50.0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.add, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: Colors.indigoAccent.shade700,
        buttonBackgroundColor: Colors.indigoAccent.shade700,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
