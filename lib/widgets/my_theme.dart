import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,
      cardColor: Colors.white,
      accentColor: Colors.purple,
      backgroundColor: Colors.white,
      primaryColor: primaryLight,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 10,
        iconTheme: const IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      cardColor: Colors.white,
      accentColor: Colors.purple,
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 10,
        iconTheme: const IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));

  static Color primaryLight = const Color.fromRGBO(128, 44, 110, 1);
}
