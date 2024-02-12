// ignore_for_file: sort_child_properties_last, sized_box_for_whitespace, unused_element, no_leading_underscores_for_local_identifiers, prefer_is_not_empty, avoid_print, prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, must_be_immutable, use_build_context_synchronously, unnecessary_brace_in_string_interps

import 'package:blessed_pakistan/Authentication/forgot_password.dart';
import 'package:blessed_pakistan/Authentication/signup.dart';
import 'package:blessed_pakistan/Dart_Backend/backend.dart';
import 'package:blessed_pakistan/DbHelper/mongodb_connection.dart';
import 'package:blessed_pakistan/Home.dart';
import 'package:blessed_pakistan/toaster.dart';
import 'package:flutter/material.dart';

// ignore: avoid_unnecessary_containers
class LoginBottomSheet extends StatefulWidget {
  @override
  _LoginBottomSheetState createState() => _LoginBottomSheetState();

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return _LoginBottomSheetContent();
      },
    );
  }
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(); // This build method can remain empty
  }
}

class _LoginBottomSheetContent extends StatelessWidget {
  bool _isPasswordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                              title: 'Home Screen'))); // Close the bottom sheet
                  // Optionally, you can navigate to the home screen here
                },
              ),
            ),

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
                "Login to Continue",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Enter Email",
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
            const SizedBox(
                height: 16), // Adding some space between input fields
            // Second Input Field
            Container(
              height: 60,
              margin: const EdgeInsets.only(top: 20),
              child: TextFormField(
                controller: passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Enter Password",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      (context as Element).markNeedsBuild();
                      _isPasswordVisible = !_isPasswordVisible;
                    },
                  ),
                ),
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()));
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.indigoAccent.shade700),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.indigoAccent.shade700),
                onPressed: () async {
                  // Retrieve values from the controllers
                  String email = emailController.text;
                  String password = passwordController.text;

                  // Perform validation
                  try {
                    if (email.isNotEmpty && password.isNotEmpty) {
                      UserRepository userRepository =
                          UserRepository(Db_Connection);
                      Map<String, dynamic>? isLoggedIn =
                          await userRepository.loginUser(email, password);
                      print(isLoggedIn);
                      if (isLoggedIn != null) {
                        // Navigate to the next screen or perform any actions needed upon successful login
                        print('Login successful!');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyHomePage(title: 'Home Screen')));
                        SnackbarHelper.showSuccess(
                            context, 'Login successful!');
                      } else {
                        // Show an error message or use a Flutter toast to notify the user
                        print('Invalid email or password. Try again.');
                        SnackbarHelper.showError(
                            context, 'Invalid email or password. Try again.');
                      }
                    } else {
                      print('fill required fields!');
                      SnackbarHelper.showError(
                          context, 'fill required fields!');
                    }
                  } catch (error) {
                    print(error);
                    SnackbarHelper.showError(context, '$error');
                  }
                },
                child: const Text(
                  'Login',
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
                      height: 1.0, // Adjust thickness of the border as needed
                      width: 100.0, // Adjust the width of the border as needed
                      color: Colors.grey[400], // Adjust color as needed
                    ),
                    const SizedBox(
                        width: 16.0), // Add space between borders and text
                    Text(
                      'or continue with',
                      style: TextStyle(fontSize: 10, color: Colors.grey[400]),
                    ),
                    const SizedBox(
                        width: 16.0), // Add space between borders and text
                    Container(
                      height: 1.0, // Adjust thickness of the border as needed
                      width: 100.0, // Adjust the width of the border as needed
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
                    'Dont Have Account?',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the bottom sheet
                      ShowSignUpBottomSheet.show(context);
                    },
                    child: const Text(
                      'Sign Up with Email!',
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
  }
}
