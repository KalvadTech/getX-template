import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '/src/config/config.dart';

/// A theme configuration for the app, with light and dark mode handling.
final ThemeData theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: ColorManager.primaryColor,
  scaffoldBackgroundColor: ColorManager.lightBackgroundColor,
  dividerColor: ColorManager.secondaryColor,
  textTheme: GoogleFonts.nunitoTextTheme(),
  buttonTheme: const ButtonThemeData(
    buttonColor: ColorManager.primaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: ColorManager.primarySwatch,
    accentColor: ColorManager.secondaryColor, // Replace accentColor here.
    backgroundColor: ColorManager.lightBackgroundColor,
    errorColor: Colors.red,
  ),
);
