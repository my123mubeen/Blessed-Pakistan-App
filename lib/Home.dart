// ignore_for_file: deprecated_member_use, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print, unnecessary_import, unused_element
import 'package:blessed_pakistan/appbar.dart';
import 'package:blessed_pakistan/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage(
      title: 'Blessed Pakistan',
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




class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MyAppBar(title: "Home Screen"),
        drawer: MyDrawerScreen(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'In Progress:',
              ),
              Text(
                "Home Page",
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}





  // Widget buildDrawer() {
  //   return Drawer(
  //     child: ListView(
  //       // padding: EdgeInsets.all(1.0),
  //       children: <Widget>[
  //         DrawerHeader(
  //           decoration: BoxDecoration(
  //             border: Border.all(color: Colors.transparent),
  //             // color: Colors.blue[700],
  //           ),
  //           child: Column(
  //             children: [
  //               Row(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Container(
  //                     width: 80,
  //                     height: 80,
  //                     child: const Image(
  //                       image: AssetImage("assets/logo.jpg"),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(top: 30.0),
  //                     child: Text(
  //                       'Blessed Pakistan',
  //                       style: TextStyle(
  //                           color: Colors.black,
  //                           fontSize: 20,
  //                           fontWeight: FontWeight.w900),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Container(
  //                 // width: 190,
  //                 padding: EdgeInsets.symmetric(horizontal: 25),
  //                 decoration:
  //                     BoxDecoration(borderRadius: BorderRadius.circular(30)),
  //                 child: ElevatedButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                     LoginBottomSheet.show(context);
  //                   },
  //                   style: ElevatedButton.styleFrom(
  //                     side: BorderSide(color: Colors.blue.shade700, width: 2),
  //                     padding: EdgeInsets.all(15),
  //                     backgroundColor: Colors.white,
  //                   ),
  //                   child: Row(
  //                     children: [
  //                       Text(
  //                         'Login or Create Account',
  //                         style: TextStyle(
  //                           color: Colors.black,
  //                           fontSize: 14,
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         width: 8,
  //                       ),
  //                       Icon(
  //                         CupertinoIcons.right_chevron,
  //                         color: Colors.blue.shade700,
  //                         size: 15,
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         buildDrawerItem(
  //           'Home',
  //           Icons.home_rounded,
  //           MyHomePage(title: 'title'),
  //           alwaysActive: true,
  //         ),
  //         buildDrawerItem('Add Property', Icons.add_rounded, AddPropertyPage()),
  //         buildDrawerItem('Search Properties', Icons.search_rounded,
  //             SearchPropertiesPage()),
  //         buildDrawerItem(
  //             'News Projects', Icons.add_rounded, NewsProjectsPage()),
  //         buildDrawerItem('Saved Searches', Icons.saved_search_rounded,
  //             SavedSearchesPage()),
  //         buildDrawerItem('Favorites', Icons.favorite_rounded, FavoritesPage()),
  //         // Add more items as needed
  //       ],
  //     ),
  //   );
  // }

  // Container buildDrawerItem(String title, IconData icon, Widget routeName,
  //     {bool alwaysActive = false}) {
  //   bool isSelected = _selectedDrawerItem == title || alwaysActive;

  //   return Container(
  //     margin:
  //         isSelected ? EdgeInsets.only(right: 16) : EdgeInsets.only(right: 16),
  //     decoration: BoxDecoration(
  //       color: isSelected ? Colors.blue[700] : Colors.transparent,
  //       borderRadius: isSelected
  //           ? BorderRadius.only(
  //               topRight: Radius.circular(26),
  //               bottomRight: Radius.circular(26),
  //             )
  //           : BorderRadius.only(
  //               topRight: Radius.circular(26),
  //               bottomRight: Radius.circular(26),
  //             ),
  //     ),
  //     child: ListTile(
  //       tileColor: Colors.transparent,
  //       selectedTileColor: Colors.blue[700],
  //       title: Text(
  //         title,
  //         style: isSelected
  //             ? TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 16,
  //               )
  //             : TextStyle(
  //                 color: Colors.grey[800],
  //                 fontSize: 16,
  //               ),
  //       ),
  //       leading: Icon(
  //         icon,
  //         color: isSelected ? Colors.white : Colors.grey[800],
  //       ),
  //       onTap: () {
  //         // Handle drawer item click
  //         setState(() {
  //           _selectedDrawerItem = title;
  //         });
  //         Navigator.pop(context); // Close the drawer
  //         // Add navigation logic here if needed
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => routeName));
  //       },
  //     ),
  //   );
  // }

//   Container buildDrawerItem(String title, IconData icon, Widget routeName) {
//     return Container(
//       margin: _selectedDrawerItem == title
//           ? EdgeInsets.only(right: 16)
//           : EdgeInsets.only(right: 16), // Add padding from the right
//       decoration: BoxDecoration(
//         color: _selectedDrawerItem == title
//             ? Colors.blue[700]
//             : Colors.transparent,
//         borderRadius: _selectedDrawerItem == title
//             ? BorderRadius.only(
//                 topRight: Radius.circular(26),
//                 bottomRight: Radius.circular(26),
//               )
//             : BorderRadius.only(
//                 topRight: Radius.circular(26),
//                 bottomRight: Radius.circular(26),
//               ),
//       ),
//       child: ListTile(
//         tileColor: Colors.transparent,
//         selectedTileColor: Colors.blue[700],
//         title: Text(
//           title,
//           style: _selectedDrawerItem == title
//               ? TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                 )
//               : TextStyle(
//                   color: Colors.grey[800],
//                   fontSize: 16,
//                 ),
//         ),
//         leading: Icon(
//           icon,
//           color: Colors.white,
//         ),
//         onTap: () {
//           // Handle drawer item click
//           setState(() {
//             _selectedDrawerItem = title;
//           });
//           Navigator.pop(context); // Close the drawer
//           // Add navigation logic here if needed
//           print(routeName);
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => routeName));
//         },
//       ),
//     );
//   }
// }
