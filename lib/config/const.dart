import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF00A79B);
const Color secondaryColor = Color(0xFF97EFC5);
const Color backgroundColor = Colors.white;
const Color appBarColor = Colors.white;
const Color iconsColor = Colors.black;
const Color titleColor = Colors.black;
const Color bodyColor = Colors.black;


TextTheme textTheme = const TextTheme(
  headline1: TextStyle(color: titleColor, decoration: TextDecoration.none),
  headline2: TextStyle(color: titleColor, decoration: TextDecoration.none),
  headline3: TextStyle(color: titleColor, decoration: TextDecoration.none),
  headline4: TextStyle(color: titleColor, decoration: TextDecoration.none),
  headline5: TextStyle(color: bodyColor, decoration: TextDecoration.none),
  headline6: TextStyle(color: bodyColor, decoration: TextDecoration.none),
  bodyText1: TextStyle(color: bodyColor, decoration: TextDecoration.none),
  bodyText2: TextStyle(color: bodyColor, decoration: TextDecoration.none),
  subtitle1: TextStyle(color: bodyColor, decoration: TextDecoration.none),
  subtitle2: TextStyle(color: bodyColor, decoration: TextDecoration.none),
  caption: TextStyle(color: titleColor, decoration: TextDecoration.none),
  button: TextStyle(color: bodyColor, decoration: TextDecoration.none),
  overline: TextStyle(color: bodyColor, decoration: TextDecoration.none),
);

ThemeData theme = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: backgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: appBarColor,
    elevation: 0,
    iconTheme: IconThemeData(color: iconsColor),
  ),
  iconTheme: const IconThemeData(color: iconsColor),
  textTheme: GoogleFonts.latoTextTheme(textTheme),
);
