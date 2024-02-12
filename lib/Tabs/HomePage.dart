// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, library_private_types_in_public_api

import 'package:blessed_pakistan/Dashboard/BrowesPropertyContent/content.dart';
import 'package:blessed_pakistan/Dashboard/RecentSearches/recentsearches.dart';
import 'package:blessed_pakistan/drawer.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      key: _scaffoldKey,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40))),
              backgroundColor: Colors.indigoAccent.shade700,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Container(
                              width: 80,
                              height: 80,
                              child: const Image(
                                image: AssetImage("assets/images/logo.jpg"),
                                width: 160,
                                height: 150,
                              ),
                            ),
                          ),
                          Text(
                            'Blessed Pakistan',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ToggleSwitch(
                        minWidth: 90.0,
                        fontSize: 16.0,
                        cornerRadius: 20.0,
                        initialLabelIndex: 1,
                        activeBgColor: [Colors.white],
                        activeFgColor: Colors.black,
                        inactiveBgColor: Colors.grey.shade200,
                        inactiveFgColor: Colors.grey[900],
                        totalSwitches: 2,
                        labels: ['Rent', 'Buy'],
                        onToggle: (index) {
                          selectedIndex = index!;
                          print('switched to: $index');
                        },
                      ),
                      Container(
                        height: 60,
                        margin: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Search for Houses, Plots, Flats..",
                            filled: true,
                            fillColor: Colors.white,
                            labelStyle: TextStyle(fontSize: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                          style: const TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.white),
            )
          ];
        },
        body: DashboardContent(),
      ),
      drawer: MyDrawerScreen(),
    );
  }
}

class DashboardContent extends StatefulWidget {
  const DashboardContent({Key? key}) : super(key: key);

  @override
  _DashboardContentState createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Future<void> _tabControllerInitializer;

  @override
  void initState() {
    super.initState();
    _tabControllerInitializer = _initializeTabController();
  }

  Future<void> _initializeTabController() async {
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _tabControllerInitializer,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Loading indicator
        } else if (snapshot.hasError) {
          return Text('Error initializing TabController: ${snapshot.error}');
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
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
                          // Adjust these values based on your requirement
                          height: 368,
                          // padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Browse Property',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TabBar(
                                  controller: _tabController,
                                  labelPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  tabs: [
                                    Tab(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.house_outlined,
                                            size: 15,
                                          ),
                                          SizedBox(
                                              width:
                                                  5), // Adjust the spacing between icon and text
                                          Text(
                                            'Homes',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Tab(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            size: 15,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            'Plots',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Tab(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.store_outlined,
                                            size: 15,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            'Commercials',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  indicatorColor: Colors.indigoAccent.shade700,
                                  labelColor: Colors.indigoAccent
                                      .shade700, // Selected tab text color
                                  unselectedLabelColor: Colors.black,
                                ),
                                SizedBox(height: 10),
                                Expanded(
                                  child: TabBarView(
                                    controller: _tabController,
                                    children: [
                                      // Homes Tab Content
                                      HomtTabbar(),
                                      // Plots Tab Content
                                      PlotsTabbar(),
                                      // Commercials Tab Content
                                      CommercialsTabbar()
                                    ],
                                  ),
                                )
                              ])),
                    ),
                  ),
                ),
                // Recent Searches
                RecentSearches(),
                // Post Add Card Conatiner
                PostAddCardConatiner()
              ],
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
