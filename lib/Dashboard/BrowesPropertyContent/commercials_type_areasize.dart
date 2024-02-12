// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:blessed_pakistan/global.dart';
import 'package:flutter/material.dart';

class CommercialsType extends StatefulWidget {
  const CommercialsType({Key? key});

  @override
  State<CommercialsType> createState() => _CommercialsTypeState();
}

class _CommercialsTypeState extends State<CommercialsType> {
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
                commercialList,
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
                    fontWeight: FontWeight.bold,
                  ),
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

class CommercialsAreaSize extends StatefulWidget {
  const CommercialsAreaSize({Key? key});

  @override
  State<CommercialsAreaSize> createState() => _CommercialsAreaSizeState();
}

class _CommercialsAreaSizeState extends State<CommercialsAreaSize> {
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
                commercialsListAreaSize,
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
