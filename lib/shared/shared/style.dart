import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static Color g60 = const Color(0xFF989898);
  static Color g30 = const Color(0xFFE9E9E9);
  static Color g90 = const Color(0xFF676767);
  static Color white = const Color(0xFFF5F5F5);

  static TextStyle txt24w600 = GoogleFonts.poppins(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: Color(0xff000000),
  );
  static TextStyle txt12w400 = GoogleFonts.inter(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: Color(0xff676767)
  );
  static TextStyle txt16w600 = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Color(0xffFFFFFF),
  );
}