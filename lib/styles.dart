import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData().copyWith(
  primaryColor: Color(0xFF517398),
  scaffoldBackgroundColor: Color(0xFFE5E5E5),
  appBarTheme: AppBarTheme(
    color: Color(0xFF517398),
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 2.0, // Add slight elevation to app bar
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.white, // Установите нужный цвет текста здесь
    ),
    bodyText2: TextStyle(
      color: Color(0xFF517398), // Установите нужный цвет текста здесь
    ),
    // Define other text styles here using GoogleFonts
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF517398)),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF517398),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
  ),
  // Define other theme properties as needed
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF517398), // Set the background color of FloatingActionButton
  ),

);
