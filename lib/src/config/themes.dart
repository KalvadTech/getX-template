import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/src/config/config.dart';
import '/src/utils/utils.dart';

ThemeData theme = createTheme(
  brightness: Brightness.light,
  systemOverlayStyle: SystemUiOverlayStyle.dark,
  primarySwatch: primarySwatch,
  background: backgroundColor,
  primaryText: Colors.black,
  secondaryText: Colors.white,
  accentColor: secondaryColor,
  divider: secondaryColor,
  buttonBackground: Colors.black38,
  buttonText: secondaryColor,
  disabled: secondaryColor,
  error: Colors.red,
);


ThemeData darkTheme = createTheme(
  brightness: Brightness.dark,
  systemOverlayStyle: SystemUiOverlayStyle.light,
  primarySwatch: primarySwatch,
  background: Colors.black,
  primaryText: Colors.white,
  secondaryText: Colors.grey,
  accentColor: secondaryColor,
  divider: secondaryColor,
  buttonBackground: Colors.black38,
  buttonText: secondaryColor,
  disabled: secondaryColor,
  error: Colors.red,
);