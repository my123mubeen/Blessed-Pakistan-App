// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print, deprecated_member_use, camel_case_types
import 'package:blessed_pakistan/global.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Db_Connection {
  static Db? _db;

  static Future<Db> connect() async {
    print("Function Called");
    var a = GLOBAL();
    if (_db == null || _db?.state != State.OPEN) {
      _db = await Db.create(a.db);
      await _db!.open();
      print("Connected to mongodb");
    }
    return _db!;
  }

  static Db get instance => _db!;
}
