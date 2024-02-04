// otp_verification_page.dart
// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables, sized_box_for_whitespace, prefer_typing_uninitialized_variables
import 'package:blessed_pakistan/toaster.dart';
import 'package:flutter/material.dart';
import 'package:blessed_pakistan/Authentication/set_password.dart';
import 'package:blessed_pakistan/appbar.dart';

class OTPVerificationPage extends StatefulWidget {
  final Map<String, String> data;

  OTPVerificationPage({required this.data});

  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'OTP Verification',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Similar card for OTP verification
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
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
                        "Enter your verification code to Continue",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // New input field for email
                    Container(
                      height: 60,
                      margin: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: otpController,
                        decoration: InputDecoration(
                          labelText: "Enter OTP Code",
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
                    SizedBox(height: 16),

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
                          // Handle OTP verification logic
                          String enteredOTP = otpController.text;
                          print(widget.data['otp']);

                          // Compare entered OTP with generated OTP
                          if (enteredOTP == widget.data['otp']) {
                            print('OTP verification successful!');
                            enteredOTP = "";

                            try {
                              // Add your logic for successful verification and navigation
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreateAccountPage(
                                    username: widget.data['username'] ?? '',
                                    email: widget.data['email'] ?? '',
                                    userType: widget.data['userType'] ?? '',
                                  ),
                                ),
                              );

                              // Show success message
                              SnackbarHelper.showSuccess(
                                context,
                                'OTP verification successful!',
                              );
                            } catch (error) {
                              // Handle any errors during navigation or other logic
                              print('Error: $error');
                              // Show error message
                              SnackbarHelper.showError(
                                context,
                                'Error during OTP verification. Please try again.',
                              );
                            }
                          } else {
                            print('Invalid OTP. Try again.');
                            // Show error message
                            SnackbarHelper.showError(
                              context,
                              'Invalid OTP. Please try again.',
                            );
                          }
                        },
                        child: const Text(
                          'Verify OTP',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OTPVerificationForgotPassword extends StatefulWidget {
  final Map<String, String> data;

  OTPVerificationForgotPassword({required this.data});

  @override
  _OTPVerificationForgotPasswordState createState() =>
      _OTPVerificationForgotPasswordState();
}

class _OTPVerificationForgotPasswordState
    extends State<OTPVerificationForgotPassword> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'OTP Verification',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Similar card for OTP verification
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
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
                        "OTP verification",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // New input field for email
                    Container(
                      height: 60,
                      margin: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: otpController,
                        decoration: InputDecoration(
                          labelText: "Enter OTP Code",
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
                    SizedBox(height: 16),
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
                        onPressed: () {
                          // Handle OTP verification logic
                          String enteredOTP = otpController.text;
                          print(enteredOTP);
                          print(widget);
                          // Compare entered OTP with generated OTP
                          if (enteredOTP == widget.data['otp']) {
                            // OTP verification successful
                            print('OTP verification successful!');
                            enteredOTP = "";
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangePassWord(
                                  email: widget.data['email'] ?? '',
                                ),
                              ),
                            );
                            // Show success message
                            SnackbarHelper.showSuccess(
                              context,
                              'OTP verification successful!',
                            );
                          } else {
                            // Invalid OTP
                            print('Invalid OTP. Try again.');
                            // Show error message
                            SnackbarHelper.showError(
                              context,
                              'Invalid OTP. Please try again.',
                            );
                          }
                        },
                        child: const Text(
                          'Verify OTP Code',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
