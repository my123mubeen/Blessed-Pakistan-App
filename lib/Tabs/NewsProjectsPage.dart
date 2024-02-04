// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:blessed_pakistan/appbar.dart';
import 'package:blessed_pakistan/drawer.dart';
import 'package:flutter/material.dart';

class NewsProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'New Projects Page'),
      drawer: MyDrawerScreen(),
      body: Center(
        child: Text('This is the News Projects Page'),
      ),
    );
  }
}
