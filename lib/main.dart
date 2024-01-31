// main.dart
// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable, non_constant_identifier_names
import 'package:blessed_pakistan/DbHelper/mongodb_connection.dart';
import 'package:blessed_pakistan/splash_screen.dart';
import 'package:flutter/material.dart';

Future<void> Connection() async {
  var db = await Db_Connection.connect();
}

void main() async {
  Connection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blessed Pakistan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      // const MyHomePage(title: 'Home Page'),
    );
  }
}
