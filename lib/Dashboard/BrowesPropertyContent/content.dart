// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blessed_pakistan/Dashboard/BrowesPropertyContent/commercials_type_areasize.dart';
import 'package:blessed_pakistan/Dashboard/BrowesPropertyContent/home_type_areaSize.dart';
import 'package:blessed_pakistan/Dashboard/BrowesPropertyContent/plot_type_areasize.dart';
import 'package:flutter/material.dart';

class HomtTabbar extends StatefulWidget {
  const HomtTabbar({Key? key}) : super(key: key);

  @override
  State<HomtTabbar> createState() => _HomtTabbarState();
}

class _HomtTabbarState extends State<HomtTabbar>
    with SingleTickerProviderStateMixin {
  late TabController _tabhomeController;
  late Future<void> _tabControllerInitializer;

  @override
  void initState() {
    super.initState();
    _tabControllerInitializer = _initializeTabController();
  }

  Future<void> _initializeTabController() async {
    _tabhomeController = TabController(length: 2, vsync: this);
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
            return Column(
              children: [
                TabBar(
                  controller: _tabhomeController,
                  labelPadding: EdgeInsets.symmetric(horizontal: 46.0),
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.category_outlined,
                            size: 15,
                          ),
                          SizedBox(
                              width:
                                  5), // Adjust the spacing between icon and text
                          Text(
                            'Type',
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.crop_square_outlined,
                            size: 15,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Area Size',
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
                  labelColor:
                      Colors.indigoAccent.shade700, // Selected tab text color
                  unselectedLabelColor: Colors.black,
                ),
                SizedBox(height: 10),
                Expanded(
                  child: TabBarView(
                    controller: _tabhomeController,
                    children: [Hometype(), HomeAreaSize()],
                  ),
                )
              ],
            );
          }
        });
  }

  @override
  void dispose() {
    _tabhomeController.dispose();
    super.dispose();
  }
}

class PlotsTabbar extends StatefulWidget {
  const PlotsTabbar({super.key});

  @override
  State<PlotsTabbar> createState() => _PlotsTabbarState();
}

class _PlotsTabbarState extends State<PlotsTabbar>
    with SingleTickerProviderStateMixin {
  late TabController _tabplotController;
  late Future<void> _tabControllerInitializer;

  @override
  void initState() {
    super.initState();
    _tabControllerInitializer = _initializeTabController();
  }

  Future<void> _initializeTabController() async {
    _tabplotController = TabController(length: 2, vsync: this);
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
            return Column(
              children: [
                TabBar(
                  controller: _tabplotController,
                  labelPadding: EdgeInsets.symmetric(horizontal: 46.0),
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.category_outlined,
                            size: 15,
                          ),
                          SizedBox(
                              width:
                                  5), // Adjust the spacing between icon and text
                          Text(
                            'Type',
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.crop_square_outlined,
                            size: 15,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Area Size',
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
                  labelColor:
                      Colors.indigoAccent.shade700, // Selected tab text color
                  unselectedLabelColor: Colors.black,
                ),
                SizedBox(height: 10),
                Expanded(
                  child: TabBarView(
                    controller: _tabplotController,
                    children: [PlotType(), PlotAreaSize()],
                  ),
                )
              ],
            );
          }
        });
  }

  @override
  void dispose() {
    _tabplotController.dispose();
    super.dispose();
  }
}

class CommercialsTabbar extends StatefulWidget {
  const CommercialsTabbar({super.key});

  @override
  State<CommercialsTabbar> createState() => _CommercialsTabbarState();
}

class _CommercialsTabbarState extends State<CommercialsTabbar>
    with SingleTickerProviderStateMixin {
  late TabController _tabcommercialsController;
  late Future<void> _tabControllerInitializer;

  @override
  void initState() {
    super.initState();
    _tabControllerInitializer = _initializeTabController();
  }

  Future<void> _initializeTabController() async {
    _tabcommercialsController = TabController(length: 2, vsync: this);
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
            return Column(
              children: [
                TabBar(
                  controller: _tabcommercialsController,
                  labelPadding: EdgeInsets.symmetric(horizontal: 46.0),
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.category_outlined,
                            size: 15,
                          ),
                          SizedBox(
                              width:
                                  5), // Adjust the spacing between icon and text
                          Text(
                            'Type',
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.crop_square_outlined,
                            size: 15,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Area Size',
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
                  labelColor:
                      Colors.indigoAccent.shade700, // Selected tab text color
                  unselectedLabelColor: Colors.black,
                ),
                SizedBox(height: 10),
                Expanded(
                  child: TabBarView(
                    controller: _tabcommercialsController,
                    children: [CommercialsType(), CommercialsAreaSize()],
                  ),
                )
              ],
            );
          }
        });
  }

  @override
  void dispose() {
    _tabcommercialsController.dispose();
    super.dispose();
  }
}
