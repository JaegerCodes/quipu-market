
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quipumarket/theme/Colors.dart';

TextTheme textTheme({Color color = ColorTheme.WHITE_900}) { 
  return TextTheme(
    headline1: GoogleFonts.nunitoSans(
      fontSize: 98,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
      color: color,
    ),
    headline2: GoogleFonts.nunitoSans(
      fontSize: 61,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
      color: color,
    ),
    headline3: GoogleFonts.nunitoSans(
      fontSize: 49,
      fontWeight: FontWeight.w400,
      color: color,
    ),
    headline4: GoogleFonts.nunitoSans(
      fontSize: 35,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: color,
    ),
    headline5: GoogleFonts.nunitoSans(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: color,
    ),
    headline6: GoogleFonts.nunitoSans(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: color,
    ),
    subtitle1: GoogleFonts.nunitoSans(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Color(0xff6C7E99),
    ),
    subtitle2: GoogleFonts.nunitoSans(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: color,
    ),
    bodyText1: GoogleFonts.nunitoSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: color,
    ),
    bodyText2: GoogleFonts.nunitoSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: color,
    ),
    button: GoogleFonts.nunitoSans(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      color: color,
    ),
    caption: GoogleFonts.nunitoSans(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: color,
    ),
    overline: GoogleFonts.nunitoSans(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      color: color,
    ),
  );
}


