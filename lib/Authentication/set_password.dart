// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_is_not_empty

import 'package:blessed_pakistan/Authentication/login.dart';
import 'package:blessed_pakistan/Dart_Backend/backend.dart';
import 'package:blessed_pakistan/DbHelper/mongodb_connection.dart';
import 'package:blessed_pakistan/appbar.dart';
import 'package:blessed_pakistan/drawer.dart';
import 'package:blessed_pakistan/toaster.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  final String username;
  final String email;
  final String userType;

  CreateAccountPage({
    required this.username,
    required this.email,
    required this.userType,
  });

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Set Password"),
      drawer: MyDrawerScreen(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  "Set Your Passowrd to continue",
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
                margin: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: "Enter Password",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
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
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 60,
                margin: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: confirmPasswordController,
                  obscureText: !_isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: 60,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.indigoAccent.shade700),
                  onPressed: () async {
                    print(widget.username);
                    print(widget.email);
                    print(widget.userType);
                    // Check if passwords match
                    if (!passwordController.text.isEmpty &&
                        !confirmPasswordController.text.isEmpty) {
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        // Passwords match, add your logic for creating the account
                        final userRepository = UserRepository(Db_Connection);

                        // // Example: Insert a new user
                        String signup = await userRepository.insertUser(
                            widget.username,
                            widget.email,
                            widget.userType,
                            passwordController.text);

                        print(signup);
                        // Account created successfully, show an appropriate message
                        print('Account created successfully!');
                        SnackbarHelper.showSuccess(
                            context, 'Account created successfully!');

                        Navigator.pop(
                            context); // Close the current bottom sheet
                        LoginBottomSheet.show(
                            context); // Open the login bottom sheet
                        passwordController.text = '';
                        confirmPasswordController.text = '';
                      } else {
                        // Passwords do not match, show an error message or handle accordingly
                        print('Passwords do not match. Please try again.');
                        SnackbarHelper.showError(context,
                            'Passwords do not match. Please try again.');
                      }
                    } else {
                      print("Enter required passwords");
                      SnackbarHelper.showError(
                          context, 'Enter required passwords');
                    }
                  },
                  child: const Text(
                    'Create Account',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// forgot password section widget

class ChangePassWord extends StatefulWidget {
  final String email;

  ChangePassWord({required this.email});

  @override
  State<ChangePassWord> createState() => _ChangePassWordState();
}

class _ChangePassWordState extends State<ChangePassWord> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  bool _ispasswordvisible = false;
  bool _isconfirmpasswordvisible = false;

  void togglePasswordVisibility() {
    setState(() {
      _ispasswordvisible = !_ispasswordvisible;
    });
  }

  void toggleConfirmPasswordVisibility() {
    print("hit passcpde");
    setState(() {
      _isconfirmpasswordvisible = !_isconfirmpasswordvisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Set Password"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  "Set Your Passowrd to continue",
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
                margin: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: !_ispasswordvisible,
                  decoration: InputDecoration(
                    labelText: "Password",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(
                          _ispasswordvisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          togglePasswordVisibility();
                        }),
                  ),
                  style: const TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 60,
                margin: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: confirmPasswordController,
                  obscureText: !_isconfirmpasswordvisible,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isconfirmpasswordvisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        toggleConfirmPasswordVisibility();
                      },
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: 60,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.indigoAccent.shade700),
                  onPressed: () async {
                    print(widget.email);
                    // Check if passwords match
                    if (!passwordController.text.isEmpty &&
                        !confirmPasswordController.text.isEmpty) {
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        // Passwords match, add your logic for creating the account
                        final userRepository = UserRepository(Db_Connection);

                        // // Example: Insert a new user
                        String updatePassowrd =
                            await userRepository.changeUserPassword(
                                widget.email, passwordController.text);

                        print(updatePassowrd);

                        if (!updatePassowrd.isEmpty) {
                          // User already exists, show an appropriate message
                          print('Password changed successfully!.');
                          SnackbarHelper.showSuccess(
                              context, 'Password changed successfully!.');

                          Navigator.pop(
                              context); // Close the current bottom sheet
                          LoginBottomSheet.show(
                              context); // Open the login bottom sheet
                        } else {
                          // Account created successfully, show an appropriate message
                          print('Something went wrong!');
                          SnackbarHelper.showError(
                              context, 'Something went wrong!');
                        }
                      } else {
                        // Passwords do not match, show an error message or handle accordingly
                        print('Passwords do not match. Please try again.');
                        SnackbarHelper.showError(context,
                            'Passwords do not match. Please try again.');
                      }
                    } else {
                      print("fill required fields");
                      SnackbarHelper.showError(
                          context, 'fill required fields.');
                    }
                  },
                  child: const Text(
                    'Change Password',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
