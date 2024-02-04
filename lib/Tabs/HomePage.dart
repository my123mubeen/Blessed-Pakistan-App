// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MyDrawerScreen(),
      body: CustomScrollView(
        slivers: [
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
                        IconButton(
                            onPressed: () {
                              Scaffold.of(context)
                                  .openDrawer(); // This opens the drawer
                            },
                            icon: Icon(
                              Icons.list,
                              color: Colors.white,
                            )),
                        Container(
                          width: 80,
                          height: 80,
                          child: const Image(
                            image: AssetImage("assets/logo.jpg"),
                            width: 160,
                            height: 150,
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
                      initialLabelIndex: 1,
                      cornerRadius: 20.0,
                      activeBgColors: [
                        [Colors.white],
                        [Colors.white]
                      ],
                      activeFgColor: Colors.black,
                      inactiveBgColor: Colors.grey.shade100,
                      inactiveFgColor:
                          Colors.black, // Text color for inactive state
                      totalSwitches: 2,
                      labels: ['Buy', 'Rent'],
                      onToggle: (index) {
                        setState(() {
                          selectedIndex = index!;
                        });
                        print('switched to: $index');
                      },
                    ),
                    Container(
                      height: 60,
                      margin: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Search for Houses, Plots, Flats..",
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
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  width: 400,
                  height: 300,
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.shade700,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Item $index',
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                );
              },
              childCount: 10,
            ),
          ),

          // const SliverToBoxAdapter(child: DashboardContent()),
          // Add other slivers or lists as needed
        ],
      ),
    );
  }
}

class DashboardContent extends StatefulWidget {
  const DashboardContent({Key? key}) : super(key: key);

  @override
  _DashboardContentState createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          width: 400,
          height: 300,
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.blueAccent.shade700,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            'Item $index',
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
        );
      },
    );
  }
}
