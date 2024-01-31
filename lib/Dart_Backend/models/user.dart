import 'package:mongo_dart/mongo_dart.dart';

class User {
  ObjectId? id;
  String username;
  String email;
  String? password; // Password should be nullable for proper handling

  // Additional fields in the schema
  String? role;
  String? type;

  User({
    this.id,
    required this.username,
    required this.email,
    this.password,
    this.role,
    this.type,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as ObjectId?,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String?,
      role: json['role'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'role': role,
      'type': type,
    };
  }
}
