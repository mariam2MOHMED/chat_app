import 'package:flutter/material.dart';

class AppTheme{
  static Color primarycolor=Color(0xFF4882CF);
  static Color white=Color(0xFFFFFFFF);
  static Color black=Color(0xFF000000);
  static Color grey=Color(0xFF7F7F7F);
  static Color ligtgrey=Color(0xFFC7C5C5);
 static ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
   appBarTheme: AppBarTheme(
     backgroundColor: Colors.transparent,
     centerTitle: true,
     titleTextStyle: TextStyle(
       color: white,
       fontWeight: FontWeight.bold,
       fontSize: 28.0
     )
   ),
   textTheme: TextTheme(
     headlineMedium: TextStyle(
       color: black,
       fontSize: 16.0,
       fontWeight: FontWeight.bold
     ),
     headlineSmall: TextStyle(
         color: grey,
         fontSize: 14.0,
         fontWeight: FontWeight.w500
     ),
   ),
   floatingActionButtonTheme: FloatingActionButtonThemeData(
     shape: CircleBorder(),
     foregroundColor: white,
     backgroundColor: primarycolor
   )
  );
}