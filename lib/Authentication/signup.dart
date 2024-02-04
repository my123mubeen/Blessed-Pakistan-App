// ignore_for_file: sort_child_properties_last, sized_box_for_whitespace, prefer_const_constructors, use_build_context_synchronously, avoid_print, non_constant_identifier_names, prefer_is_not_empty
import 'package:blessed_pakistan/Home.dart';
import 'package:blessed_pakistan/toaster.dart';
import 'package:flutter/material.dart';
import 'package:blessed_pakistan/Authentication/OTP_Verification.dart';
import 'package:blessed_pakistan/Authentication/login.dart';
import 'package:blessed_pakistan/Dart_Backend/backend.dart';

class ShowSignUpBottomSheet {
  // Declare text editing controllers for each input field

  static TextEditingController usernameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController userTypeController = TextEditingController();

  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    userTypeController.dispose();
  }

  // final _appService = AppService();

  ShowSignUpBottomSheet(BuildContext context);
  // AnimationController localAnimationController;

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // ignore: avoid_unnecessary_containers
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.indigoAccent.shade700,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage(
                                  title:
                                      'Home Screen'))); // Close the bottom sheet
                      // Optionally, you can navigate to the home screen here
                    },
                  ),
                ),
                Container(
                  width: 200,
                  height: 150,
                  child: const Image(
                    image: AssetImage("assets/logo.jpg"),
                    width: 160,
                    height: 150,
                  ),
                ),
                const Center(
                  child: Text(
                    "SignUp to Continue",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // New input field for username
                Container(
                  height: 60,
                  margin: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: "Enter Username",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                    style: const TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // New input field for email
                Container(
                  height: 60,
                  margin: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Enter Email",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // New dropdown for user type selection
                Container(
                  height: 60,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(color: Colors.grey.shade600),
                  ),
                  child: DropdownButtonFormField<String>(
                    value:
                        null, // Initial value, set to null if you want a hint
                    decoration:
                        InputDecoration.collapsed(hintText: 'Select User Type'),
                    items: ['Agent', 'User'].map((String userType) {
                      return DropdownMenuItem<String>(
                        value: userType,
                        child: Text(userType),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // Update the selected user type
                      userTypeController.text = value ?? '';
                    },
                  ),
                ),

                const SizedBox(height: 16),

                /////////////  Sign up button //////////////////////
                Container(
                  width: double.infinity,
                  height: 60,
                  margin: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.indigoAccent.shade700,
                    ),
                    onPressed: () async {
                      // Retrieve values from the controllers
                      final String username = usernameController.text;
                      final String email = emailController.text;
                      final String userType = userTypeController.text;
                      print(username);
                      print(email);
                      print(userType);

                      try {
                        if (!username.isEmpty ||
                            !email.isEmpty ||
                            !userType.isEmpty) {
                          final appService = AppService();
                          // Perform your sign-up logic here using the retrieved values
                          String generatedOTP = await appService
                              .sendVerificationEmail(username, email);

                          if (generatedOTP ==
                              'Account already exists. Please log in or use a different email.') {
                            // Account does not exist, show error message
                            SnackbarHelper.showError(
                              context,
                              'Account already exists. Please log in or use a different email.',
                            );
                          } else {
                            final dataToSend = {
                              'username': username,
                              'email': email,
                              'userType': userType,
                              'otp': generatedOTP,
                            };
                            // Navigate to OTP verification page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    OTPVerificationForgotPassword(
                                  data: dataToSend,
                                ),
                              ),
                            );
                            usernameController.clear();
                            emailController.clear();
                            userTypeController.clear();
                            // Show success message
                            SnackbarHelper.showSuccess(context,
                                'Email send successfully for Verification!');
                          }
                        } else {
                          // Some fields are empty, show error message
                          SnackbarHelper.showError(
                              context, 'Some fields are empty');
                        }
                      } catch (error) {
                        print(error);
                        usernameController.clear();
                        emailController.clear();
                        userTypeController.clear();
                        // Show error message
                        SnackbarHelper.showError(context, 'An error occurred');
                      }
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height:
                              1.0, // Adjust thickness of the border as needed
                          width:
                              100.0, // Adjust the width of the border as needed
                          color: Colors.grey[400], // Adjust color as needed
                        ),
                        const SizedBox(
                            width: 16.0), // Add space between borders and text
                        Text(
                          'or continue with',
                          style:
                              TextStyle(fontSize: 10, color: Colors.grey[400]),
                        ),
                        const SizedBox(
                            width: 16.0), // Add space between borders and text
                        Container(
                          height:
                              1.0, // Adjust thickness of the border as needed
                          width:
                              100.0, // Adjust the width of the border as needed
                          color: Colors.grey[400], // Adjust color as needed
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Have Account?',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the bottom sheet
                          LoginBottomSheet.show(context);
                        },
                        child: const Text(
                          'Login with Email!',
                        ),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.indigoAccent.shade700),
                          overlayColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
