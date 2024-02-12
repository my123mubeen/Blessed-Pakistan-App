// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_local_variable, avoid_print

import 'package:blessed_pakistan/Add_Property/property.dart';
import 'package:blessed_pakistan/Dart_Backend/backend.dart';
import 'package:blessed_pakistan/DbHelper/mongodb_connection.dart';
// import 'package:blessed_pakistan/Dart_Backend/backend.dart';
// import 'package:blessed_pakistan/DbHelper/mongodb_connection.dart';
import 'package:blessed_pakistan/global.dart';
import 'package:flutter/material.dart';

class RecentSearches extends StatefulWidget {
  const RecentSearches({Key? key}) : super(key: key);

  @override
  State<RecentSearches> createState() => _RecentSearchesState();
}

class _RecentSearchesState extends State<RecentSearches> {
  @override
  void initState() {
    fetchSearchData();
    super.initState();
  }

  // Dummy list of recent searches
  List<String> recentSearches = [
    'Home for Rent',
    'Plots for Buy',
    'Commercials for Rent',
    'Home for rent',
    'Plots for Rent',
    'Home for Rent'
  ];

  Future<void> fetchSearchData() async {
    UserRepository userrecentsearches = UserRepository(Db_Connection);
    Map<String, dynamic>? recentSearchesData = await userrecentsearches
        .fetchUserRecentSearches(GLOBAL.userid.toString());
    print(recentSearchesData);
    // setState(() {
    //   recentSearches = recentSearchesData as List<String>;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: double.infinity,
          // height: 200,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent Searches',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recentSearches.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: 155,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.search_outlined,
                                    size: 20,
                                    color: Colors.blueAccent.shade700,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      recentSearches[index],
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.blueAccent.shade700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2, // Limit the number of lines
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                "All area sizes",
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Lahore",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade600,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.price_check_rounded,
                                    size: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Any Price",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade600,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostAddCardConatiner extends StatelessWidget {
  const PostAddCardConatiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Material(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            width: double.infinity,
            height: 170,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10), // Apply border radius here
                        image: DecorationImage(
                          image: AssetImage('assets/images/post.jpg'),
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        'Looking to sell or rent out your property',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.grey.shade100),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddProperty()));
                      },
                      child: Text(
                        'Post an Ad',
                        style: TextStyle(color: Colors.blueAccent.shade700),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
