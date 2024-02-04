// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:blessed_pakistan/appbar.dart';
import 'package:blessed_pakistan/drawer.dart';
import 'package:flutter/material.dart';

class SavedSearchesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Recent Searches'),
      drawer: MyDrawerScreen(),
      body: Center(
        child: Text('This is the Saved Searches Page'),
      ),
    );
  }
}
