import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Colors.orange, // Spotify Green
    secondary: Color(0xffFFFFFF), // White
    surface: Color(0xff1B1A1C), // Dark Surface (Background)
    tertiary: Colors.orange, // Light Green
    inversePrimary: Colors.grey.shade700, // Inverse primary color (for dark elements)
  ),
  // Updated text theme properties
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white), // Default body text color
    bodyMedium: TextStyle(color: Colors.white), // For medium size body text
    bodySmall: TextStyle(color: Colors.white), // For smaller body text
  ),
  scaffoldBackgroundColor: Color(0xff1B1A1C), // Dark surface background
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.orange, // Spotify Green for AppBar
    titleTextStyle: TextStyle(color: Colors.white), // AppBar title color
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.orange, // Green buttons
    textTheme: ButtonTextTheme.primary, // White text on buttons
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor:Colors.orange, // Green color for ElevatedButton
      foregroundColor: Colors.white, // White text for ElevatedButton
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: BorderSide(color: Colors.orange), // Green border for OutlinedButton
      foregroundColor: Colors.orange, // Green text for OutlinedButton
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.white, // White icons
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.white), // White labels for form fields
    hintStyle: TextStyle(color: Colors.white70), // Lighter white for hints
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.orange), // Green focus border
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade700), // Grey border for enabled
    ),
  ),
);
