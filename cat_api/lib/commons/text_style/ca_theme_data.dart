
import 'package:flutter/material.dart';

final ThemeData cAThemeData = ThemeData(
  fontFamily: "Volkswagen-Serial",
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontFamily: "Volkswagen-Serial",
      fontWeight: FontWeight.bold,
      fontSize: 20,
      letterSpacing: 0.06,
      color: Colors.grey,
    ),
    subtitle1: TextStyle(
      fontFamily: "Volkswagen-Serial",
      fontWeight: FontWeight.normal,
      fontSize: 16,
      letterSpacing: 0.06,
      color: Color.fromARGB(255, 71, 71, 71),
    ),
    subtitle2: TextStyle(
      fontFamily: "Volkswagen-Serial",
      fontWeight: FontWeight.bold,
      letterSpacing: 0.05,
      fontSize: 16,
      color: Colors.grey,
    ),
    headline2: TextStyle(
      fontFamily: "Volkswagen-Serial",
      fontWeight: FontWeight.normal,
      fontSize: 16,
      letterSpacing: 0.06,
      color: Colors.cyan,
    ),
    headline3: TextStyle(
      fontFamily: "Volkswagen-Serial",
      fontWeight: FontWeight.normal,
      fontSize: 18,
      letterSpacing: 0.06,
      color: Colors.cyan,
    ),
    headline4: TextStyle(
      fontFamily: "Volkswagen-Serial",
      fontWeight: FontWeight.bold,
      fontSize: 18,
      letterSpacing: 0.06,
      color: Colors.cyan,
    ),
    headline5: TextStyle(
      fontFamily: "Volkswagen-Serial",
      fontWeight: FontWeight.bold,
      fontSize: 16,
      letterSpacing: 0.06,
      color: Colors.cyan,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontFamily: "Volkswagen-Serial",
          fontSize: 16,
          letterSpacing: 0.05,
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        Colors.cyan,
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  ),
);