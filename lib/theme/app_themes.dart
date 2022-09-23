import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.orange[300],
    canvasColor: const Color.fromRGBO(255, 254, 229, 1),
    fontFamily: 'Raleway',
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 30,
        fontWeight: FontWeight.normal,
      ),
      headline2: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      headline3: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 12.5,
        fontWeight: FontWeight.w600,
      ),
      caption: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: Colors.red,
      ),
    ),
  );
}
