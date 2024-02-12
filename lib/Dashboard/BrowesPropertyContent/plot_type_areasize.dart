// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_final_fields

import 'package:blessed_pakistan/global.dart';
import 'package:flutter/material.dart';

class PlotType extends StatefulWidget {
  const PlotType({Key? key});

  @override
  State<PlotType> createState() => _PlotTypeState();
}

class _PlotTypeState extends State<PlotType> {
  int activeContainerIndex = 0;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildContainer(
                0,
                plotList,
                'Container 1',
                Colors.blue,
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
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
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item['text'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
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

class PlotAreaSize extends StatefulWidget {
  const PlotAreaSize({Key? key});

  @override
  State<PlotAreaSize> createState() => _PlotAreaSizeState();
}

class _PlotAreaSizeState extends State<PlotAreaSize> {
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
                  plotListAreaSize.sublist(0, 6),
                  'Container 1',
                  Colors.blue,
                ),
                _buildContainer(
                  1,
                  plotListAreaSize.sublist(6),
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
