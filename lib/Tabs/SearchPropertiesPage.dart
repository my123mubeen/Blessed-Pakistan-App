// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:blessed_pakistan/appbar.dart';
import 'package:blessed_pakistan/drawer.dart';
import 'package:flutter/material.dart';

class SearchPropertiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Search Property Page'),
      drawer: MyDrawerScreen(),
      body: Center(
        child: Text('This is the Search Properties Page'),
      ),
    );
  }
}
