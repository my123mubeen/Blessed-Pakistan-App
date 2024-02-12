// ignore_for_file: constant_identifier_names, non_constant_identifier_names, prefer_typing_uninitialized_variables
import 'package:mongo_dart/mongo_dart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const USER_COLLECTION = 'users';

class GLOBAL {
  var db =
      'mongodb+srv://mubeenijaz773:mubeen7879@cluster0.dlofbt5.mongodb.net/test';
  var cloud_name = "dhn7krsnq";
  var upload_preset = "s5yo0jlq";
  var api_key = "115229475178869";
  var api_secret = "VXazrZXJZYu8aM33tjds8oWUqx8";
  var user = "bcsm-f20-141@superior.edu.pk";
  var pass = "student123*";
  static ObjectId? userid;
  static String username = "";
  static String role = "";
  static String email = "";
}

final List<Map<String, dynamic>> homeList = [
  {'icon': FontAwesomeIcons.home, 'text': 'House'},
  {'icon': FontAwesomeIcons.building, 'text': 'Flats'},
  {'icon': FontAwesomeIcons.bed, 'text': 'Upper Portion'},
  {'icon': FontAwesomeIcons.user, 'text': 'Lower Portion'},
  {
    'icon': FontAwesomeIcons.houseUser,
    'text': 'Farm House'
  }, // Using a different icon
  {
    'icon': FontAwesomeIcons.bed,
    'text': 'Room'
  }, // Using the same icon as Upper Portion
  {
    'icon': FontAwesomeIcons.home,
    'text': 'PentHouse'
  }, // Using the same icon as House
];

final List<Map<String, String>> homeListAreaSize = [
  {"name": "5 Marla", "type": "Houses"},
  {"name": "3 Marla", "type": "Houses"},
  {"name": "7 Marla", "type": "Houses"},
  {"name": "8 Marla", "type": "Houses"},
  {"name": "10 Marla", "type": "Houses"},
  {"name": "1 Kanal", "type": "Houses"},
  {"name": "2 Kanal", "type": "Houses"},
];

final List<Map<String, dynamic>> plotList = [
  {
    'icon': FontAwesomeIcons.landmark,
    'text': 'Residential Plot'
  }, // Using a different icon
  {
    'icon': FontAwesomeIcons.building,
    'text': 'Commercial Plot'
  }, // Using the same icon as Flats
  {
    'icon': FontAwesomeIcons.tree,
    'text': 'Agricultural Land'
  }, // Using a different icon
  {
    'icon': FontAwesomeIcons.industry,
    'text': 'Industrial Land'
  }, // Using a different icon
  {
    'icon': FontAwesomeIcons.fileAlt,
    'text': 'Plot File'
  }, // Using a different icon
  {
    'icon': FontAwesomeIcons.fileSignature,
    'text': 'Plot Form'
  }, // Using a different icon
];

final List<Map<String, String>> plotListAreaSize = [
  {"name": "5 Marla", "type": "Plots"},
  {"name": "3 Marla", "type": "Plots"},
  {"name": "7 Marla", "type": "Plots"},
  {"name": "8 Marla", "type": "Plots"},
  {"name": "10 Marla", "type": "Plots"},
  {"name": "1 Kanal", "type": "Plots"},
  {"name": "2 Kanal", "type": "Plots"},
];

final List<Map<String, dynamic>> commercialList = [
  {
    'icon': FontAwesomeIcons.building,
    'text': 'Office'
  }, // Using the same icon as Flats
  {'icon': FontAwesomeIcons.store, 'text': 'Shop'}, // Using a different icon
  {
    'icon': FontAwesomeIcons.warehouse,
    'text': 'Warehouse'
  }, // Using a different icon
  {
    'icon': FontAwesomeIcons.industry,
    'text': 'Factory'
  }, // Using the same icon as Industrial Land
  {
    'icon': FontAwesomeIcons.building,
    'text': 'Building'
  }, // Using the same icon as Flats
  {
    'icon': FontAwesomeIcons.ellipsisH,
    'text': '... Others'
  }, // Using a different icon
];

final List<Map<String, String>> commercialsListAreaSize = [
  {"name": "Less than 100", "type": "Shops"},
  {"name": "100-200 Sq..", "type": "Shops"},
  {"name": "200-300 Sq..", "type": "Shops"},
  {"name": "300-400 Sq..", "type": "Shops"},
  {"name": "400-500 Sq..", "type": "Shops"},
  {"name": "More than..", "type": "Shops"},
];
