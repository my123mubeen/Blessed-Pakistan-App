// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:blessed_pakistan/global.dart';

import 'package:country_state_city_picker/country_state_city_picker.dart';

class AddProperty extends StatefulWidget {
  const AddProperty({Key? key}) : super(key: key);

  @override
  State<AddProperty> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty>
    with TickerProviderStateMixin {
  final TextEditingController _areaSizeController = TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();

// Define lists of options for Bedroom and Bathrooms
  final List<String> bedroomOptions = [
    'Studio',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];
  final List<String> bathroomOptions = ['1', '2', '3', '4', '5', '6'];

// Define variables to store selected values
  String? _selectedBedrooms;
  String? _selectedBathrooms;
  String selectedOption = '';
  String? selectedLocation;
  String? countryValue;
  String? stateValue;
  String? cityValue;
  late TabController _tabController;
  late String _selectedOption = '';
  String? _selectedAreaSizeUnit;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    // Get the selected tab index
    int tabIndex = _tabController.index;
    print('Selected tab: ${_getTabName(tabIndex)}');
  }

  String _getTabName(int index) {
    switch (index) {
      case 0:
        return 'Homes';
      case 1:
        return 'Plots';
      case 2:
        return 'Commercial';
      default:
        return '';
    }
  }

  List<DropdownMenuItem<String>> _getAreaSizeUnitItems() {
    // Define function to populate dropdown items for area size unit
    return ['Sq. Ft.', 'Sq. M.', 'Sq. Yd', 'Marla', 'Kanal'] // Adjust as needed
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        // Add back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button pressed
          },
        ),
        // Add clear button
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              Navigator.pop(context);

              // Handle clear button pressed
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
                height: 10), // Add spacing between app bar and next widget
            Card(
              elevation: 4, // Add elevation for a shadow effect
              margin: const EdgeInsets.symmetric(
                  horizontal: 16), // Add margin for the card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // Add rounded corners
              ),
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.all(16), // Add padding for inner content
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Post an Ad',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              height:
                                  8), // Add spacing between title and subtitle
                          Text(
                            'Reach Thousands of buyers and tenants in a few steps',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        width: 16), // Add spacing between text and image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          16), // Add rounded corners for the image
                      child: Image.asset(
                        'assets/images/property.jpg', // Replace 'your_image.png' with your actual image asset path
                        width: 120, // Adjust width as needed
                        height: 120, // Adjust height as needed
                        fit: BoxFit.cover, // Adjust fit as needed
                      ),
                    ),
                  ],
                ),
              ), // Set background color of the card
            ),

// Select Purpose Section

            // Select Purpose Section
            const SizedBox(
                height: 20), // Add spacing between card and purpose section

            // Purpose section
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16), // Add padding for the purpose section
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.home,
                        size: 40,
                        color: Colors.blue, // Adjust icon color as needed
                      ),
                      SizedBox(
                          width: 10), // Add spacing between icon and options
                      Text(
                        'Purpose',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 15), // Add spacing between title and options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = 'Sell';
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: selectedOption == 'Sell'
                                ? Colors.blue.withOpacity(
                                    0.2) // Change background color if selected
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Sell',
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedOption == 'Sell'
                                  ? Colors.blue // Change text color if selected
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // Add spacing between options
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = 'Rent Out';
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: selectedOption == 'Rent Out'
                                ? Colors.blue.withOpacity(
                                    0.2) // Change background color if selected
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Rent Out',
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedOption == 'Rent Out'
                                  ? Colors.blue // Change text color if selected
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(
                height: 10), // Add spacing between purpose section and border

            // Border
            Container(
              height: 1, // Set border height
              color: Colors.grey[300], // Set border color
            ),

            // Select Property Type

            const SizedBox(height: 20),

////////// Property Type section /////////////
            ///
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.blue,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.black,
                    onTap: _handleTabTap,
                    tabs: const [
                      Tab(text: 'Homes'),
                      Tab(text: 'Plots'),
                      Tab(text: 'Commercial'),
                    ],
                  ),
                  const SizedBox(
                      height:
                          10), // Add spacing between tab bar and tab bar view
                  Container(
                    height: 200, // Adjust height as needed
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildListView(homeList),
                        _buildListView(plotList),
                        _buildListView(commercialList),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            ///////// Select City  ////////////////////////

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_city, color: Colors.blue), // Add icon
                      SizedBox(width: 8), // Add spacing between icon and text
                      Text(
                        'Select City:',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SelectState(
                    // style: TextStyle(color: Colors.red),
                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },
                    onStateChanged: (value) {
                      setState(() {
                        stateValue = value;
                      });
                    },
                    onCityChanged: (value) {
                      setState(() {
                        cityValue = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Select Location:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Location',
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                    onChanged: (value) {
                      // Handle location selection
                      setState(() {
                        selectedLocation = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),

// Area Size Section
                  SizedBox(height: 20), // Spacing between sections
                  Row(
                    children: [
                      Icon(Icons.crop_square,
                          color: Colors.green), // Icon for Area Size
                      SizedBox(width: 8), // Spacing between icon and text
                      Text(
                        'Area Size:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8), // Spacing between label and input field
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _areaSizeController,
                          decoration: InputDecoration(
                            hintText: 'Enter Area Size',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                          ),
                          onChanged: (value) {
                            // Handle area size input
                          },
                        ),
                      ),
                      SizedBox(
                          width: 8), // Spacing between input field and dropdown
                      DropdownButton<String>(
                        value: _selectedAreaSizeUnit,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedAreaSizeUnit = newValue;
                          });
                        },
                        items: _getAreaSizeUnitItems(),
                      ),
                    ],
                  ),

// Total Price Section

                  SizedBox(height: 20), // Spacing between sections
                  Row(
                    children: [
                      Icon(Icons.attach_money,
                          color: Colors.orange), // Icon for Total Price
                      SizedBox(width: 8), // Spacing between icon and text
                      Text(
                        'Total Price:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8), // Spacing between label and input field
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _totalPriceController,
                          keyboardType:
                              TextInputType.number, // Set input type to number
                          decoration: InputDecoration(
                            hintText: 'Enter Total Price',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                          ),
                          onChanged: (value) {
                            // Handle total price input
                          },
                        ),
                      ),
                    ],
                  ),

/////////////////// Bedroom Section ////////////

                  SizedBox(height: 20), // Spacing between sections
                  Row(
                    children: [
                      Icon(Icons.king_bed,
                          color: Colors.blue), // Icon for Bedroom
                      SizedBox(width: 8), // Spacing between icon and text
                      Text(
                        'Bedrooms:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 8), // Spacing between label and rounded buttons
                  Wrap(
                    spacing: 8, // Spacing between buttons
                    children: bedroomOptions.map((String option) {
                      return ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedBedrooms = option;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: _selectedBedrooms == option
                              ? Colors.blue
                              : null, // Change color based on selection
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20), // Rounded corners
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8), // Padding inside the button
                          child: Text(
                            option,
                            style: TextStyle(
                              color: _selectedBedrooms == option
                                  ? Colors.white
                                  : Colors
                                      .black, // Change text color based on selection
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

// Bathrooms Section
                  SizedBox(height: 20), // Spacing between sections
                  Row(
                    children: [
                      Icon(Icons.bathtub,
                          color: Colors.green), // Icon for Bathrooms
                      SizedBox(width: 8), // Spacing between icon and text
                      Text(
                        'Bathrooms:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 8), // Spacing between label and rounded buttons
                  Wrap(
                    spacing: 8, // Spacing between buttons
                    children: bathroomOptions.map((String option) {
                      return ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedBathrooms = option;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: _selectedBathrooms == option
                              ? Colors.blue
                              : null, // Change color based on selection
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20), // Rounded corners
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8), // Padding inside the button
                          child: Text(
                            option,
                            style: TextStyle(
                              color: _selectedBathrooms == option
                                  ? Colors.white
                                  : Colors
                                      .black, // Change text color based on selection
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle submit button action
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// for select Property Type Section this Widget

  void _handleTabTap(int index) {
    setState(() {
      _selectedOption = '';
      print('Selected tab: ${_getTabName(index)}');
    });
  }

  Widget _buildListView(List<Map<String, dynamic>> itemList) {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        final icon = itemList[index]['icon'];
        final text = itemList[index]['text'];

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedOption = text;
              print('Selected option: $_selectedOption');
            });
          },
          child: Container(
            color:
                _selectedOption == text ? Colors.blue.withOpacity(0.2) : null,
            child: ListTile(
              leading: Icon(icon),
              title: Text(text),
            ),
          ),
        );
      },
    );
  }

// Locations

  List<DropdownMenuItem<String>> _getLocationItems(String city) {
    // Simulating locations for demonstration
    List<String> locations = [
      'Location 1',
      'Location 2',
      'Location 3',
    ];

    return locations.map((location) {
      return DropdownMenuItem<String>(
        value: location,
        child: Text(location),
      );
    }).toList();
  }
}
