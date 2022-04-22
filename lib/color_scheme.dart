import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff191616);
const Color secondaryColor = Color(0xff9522f5);
const Color tertiaryColor = Color(0xfff0ff24);
const Color errorColor = Color(0xfff52d2d);

const ColorScheme colorScheme = ColorScheme(
  primary: primaryColor,
  secondary: secondaryColor,
  tertiary: tertiaryColor,
  error: errorColor,
  background: primaryColor,
  onBackground: Colors.white,
  onError: errorColor,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  surface: primaryColor,
  brightness: Brightness.dark,
);
