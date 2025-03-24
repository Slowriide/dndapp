import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        ///*General
        useMaterial3: true,

        colorScheme: ColorScheme.dark(
          surface: const Color(0xff11161a),
          primary: const Color.fromARGB(255, 26, 35, 43),
          secondary: const Color.fromARGB(255, 47, 67, 85),
          inversePrimary: Colors.grey.shade700,
        ),

        ///*Icons
        iconTheme: IconThemeData(
          color: Colors.grey.shade700,
        ),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          showSelectedLabels: true,
          selectedIconTheme: const IconThemeData(color: Colors.red),
          selectedLabelStyle: const TextStyle(color: Colors.white),
          selectedItemColor: Colors.white,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey[700],
          unselectedIconTheme: IconThemeData(color: Colors.grey[700]),
          unselectedLabelStyle: const TextStyle(
            color: Colors.white,
          ),
        ),

        ///* Texts
        textTheme: TextTheme(
          titleLarge: GoogleFonts.roboto().copyWith(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleMedium: GoogleFonts.roboto().copyWith(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleSmall: GoogleFonts.roboto().copyWith(fontSize: 20),
          bodyLarge: GoogleFonts.roboto().copyWith(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          bodyMedium: GoogleFonts.roboto().copyWith(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
          bodySmall:
              GoogleFonts.roboto().copyWith(color: Colors.white, fontSize: 15),
          labelSmall:
              GoogleFonts.roboto().copyWith(color: Colors.white, fontSize: 15),
          labelMedium: GoogleFonts.roboto().copyWith(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
        ),
      );
}
