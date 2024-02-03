// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print, use_build_context_synchronously, non_constant_identifier_names, prefer_is_not_empty, unnecessary_cast, unnecessary_brace_in_string_interps

import 'package:blessed_pakistan/Authentication/OTP_Verification.dart';
import 'package:blessed_pakistan/Dart_Backend/backend.dart';
import 'package:blessed_pakistan/appbar.dart';
import 'package:blessed_pakistan/toaster.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Forgot Passowrd'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 150,
                  child: const Image(
                    image: AssetImage("assets/images/logo.jpg"),
                    width: 160,
                    height: 150,
                  ),
                ),
                const Center(
                  child: Text(
                    "Enter your email to reset the password",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 60,
                  margin: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.blue[600]),
                    onPressed: () async {
                      // Retrieve values from the controllers
                      // final String username = usernameController.text;
                      final String email = emailController.text;

                      try {
                        if (!email.isEmpty) {
                          final app_service = AppServiceForgotPassword();
                          // Perform your sign-up logic here using the retrieved values
                          String verificationResult =
                              await app_service.sendVerificationEmail(email);
                          if (verificationResult ==
                              'Account does not exist. Please create an account first.') {
                            // Account does not exist, show message
                            print(verificationResult);
                            SnackbarHelper.showError(
                                context, verificationResult as String);
                          } else {
                            // Account exists, proceed to OTP verification
                            print('OTP sent successfully: $verificationResult');
                            final dataToSend = {
                              'email': email,
                              'otp': verificationResult,
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
                            SnackbarHelper.showSuccess(
                                context, 'OTP sent successfully at ${email}');

                            emailController.clear();
                          }
                        } else {
                          // Email field is empty
                          print('Your field is empty');
                          SnackbarHelper.showError(
                              context, 'Your field is empty');
                        }
                      } catch (error) {
                        // Handle other errors
                        print(error);
                        SnackbarHelper.showError(context, error as String);

                        emailController.clear();
                      }
                    },
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
