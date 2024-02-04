// ignore_for_file: prefer_const_constructors

import 'package:blessed_pakistan/Authentication/login.dart';
import 'package:blessed_pakistan/Home.dart';
import 'package:blessed_pakistan/global.dart';
import 'package:blessed_pakistan/toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:blessed_pakistan/Tabs/AddPropertyPage.dart';
import 'package:blessed_pakistan/Tabs/FavoritesPage.dart';
import 'package:blessed_pakistan/Tabs/NewsProjectsPage.dart';
import 'package:blessed_pakistan/Tabs/SavedSearchesPage.dart';
import 'package:blessed_pakistan/Tabs/SearchPropertiesPage.dart';

class MyDrawerScreen extends StatefulWidget {
  const MyDrawerScreen({Key? key}) : super(key: key);

  @override
  _MyDrawerScreenState createState() => _MyDrawerScreenState();
}

class _MyDrawerScreenState extends State<MyDrawerScreen> {
  String _selectedDrawerItem = 'Home'; // Default selected item
  final globaldata = GLOBAL();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // surfaceTintColor: Colors.white,
      child: ListView(
        // padding: EdgeInsets.all(1.0),
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              // color: Colors.blue[700],
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      child: const Image(
                        image: AssetImage("assets/logo.jpg"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        'Blessed Pakistan',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: GLOBAL.userid != null
                      ? Text(
                          'Welcome ${GLOBAL.username}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      : Container(
                          // width: 190,
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              LoginBottomSheet.show(context);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Adjust the radius as needed
                              ),
                              side: BorderSide(
                                  color: Colors.indigoAccent.shade700,
                                  width: 2),
                              padding: EdgeInsets.all(15),
                              backgroundColor: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Login or Create Account',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  CupertinoIcons.right_chevron,
                                  color: Colors.indigoAccent.shade700,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
          buildDrawerItem(
            'Home',
            Icons.home_rounded,
            MyHomePage(title: 'title'),
            alwaysActive: true,
          ),
          buildDrawerItem('Add Property', Icons.add_rounded, AddPropertyPage()),
          buildDrawerItem('Search Properties', Icons.search_rounded,
              SearchPropertiesPage()),
          buildDrawerItem(
              'News Projects', Icons.add_rounded, NewsProjectsPage()),
          buildDrawerItem('Saved Searches', Icons.saved_search_rounded,
              SavedSearchesPage()),
          buildDrawerItem('Favorites', Icons.favorite_rounded, FavoritesPage()),
          // Add more items as needed
          Center(
            child: GLOBAL.userid != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      width: 180,
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          LoginBottomSheet.show(context);
                          GLOBAL.userid = null;
                          GLOBAL.username = '';
                          GLOBAL.role = '';
                          GLOBAL.email = '';
                          SnackbarHelper.showSuccess(
                              context, "Logout successfully!");
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Adjust the radius as needed
                          ),
                          side: BorderSide(
                              color: Colors.indigoAccent.shade700, width: 2),
                          padding: EdgeInsets.all(15),
                          backgroundColor: Colors.white,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.exit_to_app_rounded,
                                color: Colors.blue.shade700,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }

  Container buildDrawerItem(String title, IconData icon, Widget routeName,
      {bool alwaysActive = false}) {
    bool isSelected = _selectedDrawerItem == title || alwaysActive;

    return Container(
      height: isSelected ? 50 : 50,
      margin: isSelected
          ? const EdgeInsets.only(right: 16, bottom: 5)
          : const EdgeInsets.only(right: 16, bottom: 5),
      decoration: BoxDecoration(
        color: isSelected ? Colors.indigoAccent.shade700 : Colors.transparent,
        borderRadius: isSelected
            ? const BorderRadius.only(
                topRight: Radius.circular(26),
                bottomRight: Radius.circular(26),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(26),
                bottomRight: Radius.circular(26),
              ),
      ),
      child: Center(
        child: ListTile(
          tileColor: Colors.transparent,
          selectedTileColor: Colors.blue[700],
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: isSelected
                  ? const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )
                  : TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                    ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey[800],
            ),
          ),
          onTap: () {
            setState(() {
              _selectedDrawerItem = title;
            });
            Navigator.pop(context); // Close the drawer
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => routeName));
          },
        ),
      ),
    );
  }
}
