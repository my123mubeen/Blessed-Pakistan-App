// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.indigoAccent.shade700,
      centerTitle: true,
      // Add any other app bar customization here
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// class CustomShape extends ContinuousRectangleBorder {
//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     Path path = super.getOuterPath(rect, textDirection: textDirection);
//     path.lineTo(rect.left, rect.bottom);
//     path.lineTo(rect.right, rect.bottom);
//     return path;
//   }
// }

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HomeAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // title: Text(
      //   title,
      //   style: TextStyle(color: Colors.white),
      // ),
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.indigoAccent.shade700,
      centerTitle: false,
      toolbarHeight: 200,
      titleSpacing: 0.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft:
                  Radius.circular(40))), // Set your desired toolbar height
      // Add any other app bar customization here
      actions: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 200),
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Handle search button tap
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(200); // Adjust preferred size accordingly
}
