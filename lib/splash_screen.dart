// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, sized_box_for_whitespace
import 'package:blessed_pakistan/Home.dart';
import 'package:blessed_pakistan/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Use Future.delayed to introduce a 5-second delay
    Future.delayed(const Duration(seconds: 1), () {
      // After the delay, navigate to the home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(title: 'Home Page')),
      );
    });

    // Initialize the connection during the splash screen
    Connection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          height: 400,
          child: const Image(
            image: AssetImage("assets/images/logo.jpg"),
          ),
        ),
      ),
    );
  }
}
