import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    fontFamily: "Font1",
    iconTheme: const IconThemeData(
      color: Colors.white
    ),

    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.white,),
      bodyLarge: TextStyle(color: Colors.white,),
      bodySmall: TextStyle(color: Colors.black54,fontSize: 12),
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
    colorScheme: const ColorScheme.light(
        background: Colors.transparent,
        primary: Colors.white,
        secondary: Colors.white,
        onPrimary: Colors.yellow,
        // inversePrimary: Colors.black87,
        // primaryContainer: Colors.grey,
        // onSecondary: Colors.grey.shade300,
        // secondaryContainer: Colors.white
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(color: Color.fromRGBO(232, 213, 19, 1.0),fontWeight: FontWeight.w500,fontSize: 15.5),
        iconTheme: IconThemeData(color: Colors.white)),
    buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
  );
}
