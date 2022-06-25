import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AssetPaths {
  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  static String dummyImage =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz1NfYaq_m-uJ7v4KHYXY2NI1mY_6Ctj6zeg&usqp=CAU';
  static Map catAndIcon = {
    "business": const IconData(0xe11b, fontFamily: 'MaterialIcons'),
    "entertainment": const IconData(0xe40d, fontFamily: 'MaterialIcons'),
    "environment": FontAwesomeIcons.seedling,
    "food": const IconData(0xe532, fontFamily: 'MaterialIcons'),
    "health": FontAwesomeIcons.heartPulse,
    "politics": FontAwesomeIcons.landmark,
    "science": const IconData(0xe55a, fontFamily: 'MaterialIcons'),
    "sports": const IconData(0xece8, fontFamily: 'MaterialIcons'),
    "technology": const IconData(0xe367, fontFamily: 'MaterialIcons'),
    "world": const IconData(0xe366, fontFamily: 'MaterialIcons'),
  };
}
