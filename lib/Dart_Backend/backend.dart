// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, avoid_print, avoid_types_as_parameter_names, camel_case_types, no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:math';

// import 'package:blessed_pakistan/Dashboard/RecentSearches/recentsearches.dart';
import 'package:blessed_pakistan/Dart_Backend/models/recentsearches.dart';
import 'package:crypto/crypto.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:blessed_pakistan/Dart_Backend/models/user.dart';
// import 'package:blessed_pakistan/Dart_Backend/models/recentsearches.dart';
import 'package:blessed_pakistan/DbHelper/mongodb_connection.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:blessed_pakistan/global.dart';
// import 'package:bson/bson.dart';

class AppService {
  var Global_Data = GLOBAL();

  Future<String> sendVerificationEmail(String username, String email) async {
    // Replace the values below with your actual SMTP server and credentials
    final smtpServer = SmtpServer(
      'smtp.gmail.com',
      username: Global_Data.user,
      password: Global_Data.pass,
    );

    Map<String, dynamic>? emailExists = await checkIfEmailExists(email);
    print(emailExists);
    if (emailExists != null && emailExists.isNotEmpty) {
      // If the email exists, return a message
      return 'Account already exists. Please log in or use a different email.';
    }

    // Generate a random 6-digit OTP
    final otp = _generateOTP();

    final message = Message()
      ..from = Address(Global_Data.user, 'Umair Khan')
      ..recipients.add(email)
      ..subject = 'Account Verification'
      ..html = '''
        <p>Dear $username,</p>
        <p>Thank you for creating an account with our service.</p>
        <p>Your verification code is: <strong>$otp</strong></p>
        <p>If you did not create an account with us, please ignore this email.</p>
        <p>Thank you for using our service!</p>
      ''';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ${sendReport.toString()}');
      return otp;
    } catch (e) {
      print('Error sending email: $e');
      // Handle errors or return an appropriate response
      throw Exception('Error sending email: $e');
    }
  }

  // Helper method to generate a random 6-digit OTP
  String _generateOTP() {
    Random random = Random();
    return (100000 + random.nextInt(900000)).toString();
  }

  Future<void> signUp(User user) async {
    // Ensure you have a valid database connection
    final Db _db = await Db_Connection.connect();

    final collection = _db.collection('users');

    // Check if the email is already in use
    final existingUser =
        await collection.findOne(where.eq('email', user.email));
    if (existingUser != null) {
      throw Exception('Email already in use');
    }

    // Hash the password (You should use a proper password hashing library)
    // For simplicity, we're using the password directly in this example.
    user.password = user.password; // Replace this with proper password hashing.

    // Insert the new user into the 'users' collection
    await collection.insert(user.toJson());
  }

  //  Recent Searches
}

class AppServiceForgotPassword {
  Future<String> sendVerificationEmail(String email) async {
    var GlobalData = GLOBAL();
    // Replace the values below with your actual SMTP server and credentials
    final smtpServer = SmtpServer(
      'smtp.gmail.com',
      username: GlobalData.user,
      password: GlobalData.pass,
    );

    // Check if the email exists in the database
    Map<String, dynamic>? emailExists = await checkIfEmailExists(email);
    print(emailExists);
    if (emailExists == null) {
      // If the email does not exist, return a message
      return 'Account does not exist. Please create an account first.';
    }

    // Generate a random 6-digit OTP
    final otp = _generateOTP();

    final message = Message()
      ..from = Address(GlobalData.user, 'Umair Khan')
      ..recipients.add(email)
      ..subject = 'Account Verification'
      ..html = '''
        <p>Dear User,</p>
        <p>Thank you for using our service.</p>
        <p>Your verification code is: <strong>$otp</strong></p>
        <p>If you did not request a password reset, please ignore this email.</p>
        <p>Thank you!</p>
      ''';

    try {
      final sendReport = await send(message, smtpServer);
      print('Verification Code sent: ${sendReport.toString()}');
      return otp;
    } catch (e) {
      print('Error sending email: $e');
      // Handle errors or return an appropriate response
      throw Exception('Error sending email: $e');
    }
  }

  // Helper method to generate a random 6-digit OTP
  String _generateOTP() {
    Random random = Random();
    return (100000 + random.nextInt(900000)).toString();
  }
}

Future<Map<String, dynamic>?> checkIfEmailExists(String email) async {
  final collection = Db_Connection.instance.collection('users');

  // Check if the user with the given email already exists
  final existingUser = await collection.findOne({'email': email});
  return existingUser;
}

class UserRepository {
  UserRepository(Db_Connection);

  Future<List<searches>> getCartsByUserId(id) async {
    final collection = Db_Connection.instance.collection('searches');
    final cursor = collection.find(where.eq('userId', id));
    final List<searches> recentsearches = [];

    await for (var document in cursor) {
      print("DOCUMENT LENGTH:");
      print(document.length);
      recentsearches.add(searches.fromJson(document));
    }

    return recentsearches;
  }

  String extractId(String objectId) {
    print(objectId);
    // Check if the provided string matches the expected ObjectId format
    RegExp objectIdRegex = RegExp(r'^ObjectId\("([0-9a-fA-F]{24})"\)$');
    RegExpMatch? match = objectIdRegex.firstMatch(objectId);
    if (match != null) {
      // Extract the id part from the matched string
      String id = match.group(1)!;
      return id;
    } else {
      // Return empty string if the provided string does not match the expected format
      return '';
    }
  }

  Future<Map<String, dynamic>?> fetchUserRecentSearches(String userId) async {
    try {
      String objectIdString = userId;
      String hexString = objectIdString.substring(10, 34);
      final collection = Db_Connection.instance.collection('searches');

      final recentSearches = await collection
          .find(where.eq('userid', hexString))
          .toList(); // Convert stream to list

      print(recentSearches); // Print the fetched data
      return recentSearches.isNotEmpty
          ? recentSearches.first
          : null; // Return the fetched data or null if empty
    } catch (e) {
      print('Error fetching recent searches: $e');
      return null; // Return null in case of an error
    }
  }

  Future<String> insertUser(
      String username, String email, String role, String password) async {
    var bytes = utf8.encode(password); // convert the password to bytes
    var hashedPassword = sha256.convert(bytes).toString();

    final collection = Db_Connection.instance.collection('users');

    // User does not exist, create a new user
    await collection.insert({
      'username': username,
      'email': email,
      'role': role,
      'password': hashedPassword,
    });

    // Account created successfully
    return 'Account created successfully';
  }

  Future<String> changeUserPassword(String email, String password) async {
    var bytes = utf8.encode(password); // convert the password to bytes
    var hashedPassword = sha256.convert(bytes).toString();

    final collection = Db_Connection.instance.collection('users');

    // Check if the user with the given email exists
    final existingUser = await collection.findOne({'email': email});

    if (existingUser != null) {
      // User with the given email exists, update the password
      await collection.update(
        {'email': email},
        {
          '\$set': {'password': hashedPassword}
        },
      );

      // Password updated successfully
      return 'Password updated successfully';
    }

    // User does not exist with the given email
    return 'User does not exist';
  }

  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    final collection = Db_Connection.instance.collection('users');
    Map<String, dynamic>? user = await collection.findOne({'email': email});

    if (user != null) {
      // User found in the database, check hashed password
      var bytes =
          utf8.encode(password); // convert the entered password to bytes
      var hashedPassword = sha256.convert(bytes).toString();

      if (user['password'] == hashedPassword) {
        // var Global_Data = GLOBAL();
        GLOBAL.userid = user['_id'];
        GLOBAL.username = user['username'];
        GLOBAL.email = user['email'];
        GLOBAL.role = user['role'];
        return user;
      }
    }
    // Invalid email or password
    return null;
  }
  // Add other user-related operations (find, update, delete) here
}
