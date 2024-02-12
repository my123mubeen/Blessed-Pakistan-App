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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

final List<Widget> _screens = [
  HomePageContent(),
  NewsProjectsPage(),
  SearchPropertiesPage(),
  FavoritesPage(),
  AddPropertyPage(),
];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawerScreen(),
      body: _screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 50.0,
        items: <Widget>[
          _buildNavItem(Icons.home, 'Home'),
          _buildNavItem(FontAwesomeIcons.projectDiagram, 'Projects'),
          _buildNavItem(Icons.search_rounded, 'Search'),
          _buildNavItem(Icons.favorite, 'Favorite'),
          _buildNavItem(Icons.person, 'Profile'),
        ],
        color: Colors.indigoAccent.shade700,
        buttonBackgroundColor: Colors.indigoAccent.shade700,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildNavItem(IconData iconData, String label) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: 10),
            Icon(
              iconData,
              size: 20,
              color: Colors.white,
            ),
            SizedBox(height: 4), // Adjust the spacing between icon and text
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 8, // Adjust the font size as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
