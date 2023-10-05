import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyPeltarTheme{
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.poppins(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
    displayLarge: GoogleFonts.poppins(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.poppins(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w700),
    displaySmall: GoogleFonts.poppins(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.poppins(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
  );
  static const MaterialColor color = MaterialColor(
    0xFF00337C, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50:  Color(0xFF00337C),//10%
      100: Color(0xFF00337C),//20%
      200: Color(0xFF00337C),//30%
      300: Color(0xFF00337C),//40%
      400: Color(0xFF00337C),//50%
      500: Color(0xFF00337C),//60%
      600: Color(0xFF00337C),//70%
      700: Color(0xFF00337C),//80%
      800: Color(0xFF00337C),//90%
      900: Color(0xFF00337C),//100%
    },
  );

  static ThemeData light(){
    return ThemeData(
      primarySwatch: color,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      dividerColor: Colors.white54,
      textTheme: lightTextTheme,
    );
  }
}