// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_final_fields, sized_box_for_whitespace

import 'package:blessed_pakistan/global.dart';
import 'package:flutter/material.dart';

class Hometype extends StatefulWidget {
  const Hometype({Key? key});

  @override
  State<Hometype> createState() => _HometypeState();
}

class _HometypeState extends State<Hometype> {
  int activeContainerIndex = 0;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollEndNotification) {
              // Calculate the active container based on the scroll position
              int newIndex = (_scrollController.offset / 400).round();
              setState(() {
                activeContainerIndex = newIndex;
              });
            }
            return false;
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: Row(
              children: [
                _buildContainer(
                    0, homeList.sublist(0, 6), 'Container 1', Colors.blue),
                _buildContainer(
                    1, homeList.sublist(6), 'Container 2', Colors.yellow),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIndicator(0),
            SizedBox(width: 8),
            _buildIndicator(1),
          ],
        ),
      ],
    );
  }

  Widget _buildContainer(int index, List<Map<String, dynamic>> itemList,
      String text, Color color) {
    return Container(
      width: 350,
      height: 150,
      // color: color,
      padding: EdgeInsets.all(16),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: itemList.map((item) {
          return Container(
            width: 100,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey.shade200)), // Set the width as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(
                //   item['icon'],
                //   size: 20,
                // ),
                // SizedBox(height: 8),
                Text(
                  item['text'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildIndicator(int index) {
    return Container(
      width: activeContainerIndex == index ? 10 : 5,
      height: activeContainerIndex == index ? 10 : 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: activeContainerIndex == index
            ? Colors.indigoAccent.shade700
            : Colors.grey,
      ),
    );
  }
}

// for (List<String> items in sections)
//   Container(
//     width: 200, // Adjust the width of each section as needed
//     height: 100,
//     color: Colors.redAccent.shade400,
//     child: ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         return Container(
//           margin: EdgeInsets.symmetric(horizontal: 8.0),
//           padding: EdgeInsets.all(8.0),
//           color: Colors.blue,
//           child: Center(
//             child: Text(
//               items[index],
//               style: TextStyle(color: Colors.black),
//             ),
//           ),
//         );
//       },
//     ),
//   ),

class HomeAreaSize extends StatefulWidget {
  const HomeAreaSize({Key? key});

  @override
  State<HomeAreaSize> createState() => _HomeAreaSizeState();
}

class _HomeAreaSizeState extends State<HomeAreaSize> {
  int activeContainerIndex = 0;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollEndNotification) {
              // Calculate the active container based on the scroll position
              int newIndex = (_scrollController.offset / 400).round();
              setState(() {
                activeContainerIndex = newIndex;
              });
            }
            return false;
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: Row(
              children: [
                _buildContainer(
                  0,
                  homeListAreaSize.sublist(0, 6),
                  'Container 1',
                  Colors.blue,
                ),
                _buildContainer(
                  1,
                  homeListAreaSize.sublist(6),
                  'Container 2',
                  Colors.yellow,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIndicator(0),
            SizedBox(width: 8),
            _buildIndicator(1),
          ],
        ),
      ],
    );
  }

  Widget _buildContainer(
    int index,
    List<Map<String, dynamic>> itemList,
    String text,
    Color color,
  ) {
    return Container(
      width: 350,
      height: 150,
      // color: color,
      padding: EdgeInsets.all(16),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: itemList.map((item) {
          return Container(
            width: 100,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 17),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item['name'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  item['type'],
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 8),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildIndicator(int index) {
    return Container(
      width: activeContainerIndex == index ? 10 : 5,
      height: activeContainerIndex == index ? 10 : 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: activeContainerIndex == index
            ? Colors.indigoAccent.shade700
            : Colors.grey,
      ),
    );
  }
}
