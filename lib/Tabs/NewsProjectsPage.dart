// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_element, sized_box_for_whitespace, must_be_immutable, library_private_types_in_public_api

import 'package:blessed_pakistan/appbar.dart';
import 'package:blessed_pakistan/drawer.dart';
// import 'package:country_icons/country_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsProjectsPage extends StatefulWidget {
  @override
  State<NewsProjectsPage> createState() => _NewsProjectsPageState();
}

class _NewsProjectsPageState extends State<NewsProjectsPage> {
  final List<Map<String, dynamic>> customList = [
    {'text': 'Filter'},
    {'text': 'City', 'iconData': Icons.arrow_drop_down_rounded},
    {'text': 'Price Range', 'iconData': Icons.arrow_drop_down_rounded},
    {'text': 'Area Range', 'iconData': Icons.arrow_drop_down_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: 'New Projects'),
      drawer: MyDrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.left_chevron,
                    color: Colors.black,
                    size: 25,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Find new projects in Pakistan',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: customList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // width: 110,
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Render icon before text for the first item
                              if (index == 0)
                                Icon(
                                  Icons.filter_list,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                customList[index]['text'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              if (index !=
                                  0) // Render icon after text for items other than the first one
                                SizedBox(
                                  width: 7,
                                ),
                              Icon(
                                customList[index]['iconData'],
                                color: Colors.black,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1233 new projects in pakistan'),
                  Row(
                    children: [
                      Icon(
                        Icons.filter_list,
                        size: 20,
                        color: Colors.indigoAccent.shade700,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Popularity',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
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
                  // padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left side for displaying the picture
                      Container(
                        width: 130,
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/post.jpg'),
                            fit: BoxFit.cover, // Adjusted to BoxFit.cover
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 10), // Add some spacing between the sections
                      // Right side for displaying project-related data
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Managed by blessed pakistan',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.grey.shade200,
                                      ),
                                      padding: EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.check,
                                        size: 12,
                                        color: Colors.indigoAccent.shade700,
                                      ))
                                ],
                              ),
                              SizedBox(height: 8), // Add some vertical spacing
                              Text(
                                '29.84 Lakh to 4.51 Crore',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 4), // Add some vertical spacing
                              Text(
                                'River courtyard - The New Hellmarks ocestra josten',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey.shade400),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4), // Add some vertical spacing
                              Text(
                                'River courtyard',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 4), // Add some vertical spacing
                              Row(
                                children: [
                                  Icon(Icons.location_on,
                                      size: 13,
                                      color: Colors.indigoAccent.shade700),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Bahria Town Rawalpindi, RawalPindi',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey.shade600)),
                                child: Text(
                                  'Shpos',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 11),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      ContactBottomSheet.show(context);
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.shade200,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 11),
                                        child: Icon(
                                          CupertinoIcons.paperplane_fill,
                                          size: 20,
                                          color: Colors.indigoAccent.shade700,
                                        )),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      CallBottomSheet.show(context);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.indigoAccent.shade700,
                                          border: Border.all(
                                              color: Colors.grey.shade600)),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.call,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            'Call',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Contact Icon bottomsheet

class ContactBottomSheet extends StatefulWidget {
  @override
  _ContactBottomSheetState createState() => _ContactBottomSheetState();

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return _ContactBottomSheetContent();
      },
    );
  }
}

class _ContactBottomSheetState extends State<ContactBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(); // This build method can remain empty
  }
}

class _ContactBottomSheetContent extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.indigoAccent.shade700,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    'Have a question about this project? Make your enquiry and well get back to you soon as we can.',
                    style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Your Name*',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  // padding: EdgeInsets.only(bottom: 5),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      // labelText: "How should we address you?",
                      hintText: "How should we address you?",
                      contentPadding: EdgeInsets.all(
                        17,
                      ), // Padding for the input text
                      hintStyle: TextStyle(fontSize: 15),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    style: const TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Phone Number*',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: "phone number",
                      contentPadding: EdgeInsets.all(
                        17,
                      ), // Padding for the input text
                      hintStyle: TextStyle(fontSize: 15),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    style: const TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Email Adress(optional)*',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Enter your best email",
                      contentPadding: EdgeInsets.all(
                        17,
                      ), // Padding for the input text
                      hintStyle: TextStyle(fontSize: 15),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    margin: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.indigoAccent.shade700),
                      onPressed: () async {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.call,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          const Text(
                            'Request Call',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 36),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CallBottomSheet extends StatefulWidget {
  @override
  _CallBottomSheetState createState() => _CallBottomSheetState();

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return _CallBottomSheetContent();
      },
    );
  }
}

class _CallBottomSheetState extends State<CallBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(); // This build method can remain empty
  }
}

class _CallBottomSheetContent extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.indigoAccent.shade700,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Contact Detail',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: Colors.indigoAccent.shade700,
                      size: 17,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Number',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/flag.png',
                        height: 30, // Adjust the height as needed
                        width: 30, // Adjust the width as needed
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '+92-3094476329',
                        style: TextStyle(
                            color: Colors.indigoAccent.shade700,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
