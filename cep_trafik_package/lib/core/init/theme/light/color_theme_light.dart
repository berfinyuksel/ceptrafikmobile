import 'package:flutter/material.dart';
import '../../../extensions/string_extensions.dart';

class ColorThemeLight {
  static ColorThemeLight? _instance;
  static ColorThemeLight get instance {
    return _instance ??= ColorThemeLight.init();
  }

  ColorThemeLight.init();

  final Color brown = 'a87e6f'.color;
  final Color green = const Color.fromARGB(192, 16, 197, 46);
  final Color red =  'CC2041'.color;
  final Color white =  'ffffff'.color;
  final Color grey =  'F1F3F8'.color;
  final Color lightGrey = 'F1F3F8'.color;
  final Color darkGrey = '535965'.color;
  final Color black = '020306'.color;
  final Color azure = '3fc4eb'.color;
  final Color darkBlue =  '040f24'.color;
  final Color whiteShade =   'edf1fc'.color;
  final Color darkBlueSecondary = '19223C'.color;
  final Color darkBlueSecondaryShade = '2C3B5A'.color;

  ColorScheme get colorScheme => ColorScheme(
      primary: green, //xx
      primaryVariant: green,
      secondary: azure, //xxxx
      secondaryVariant: azure,
      surface: darkBlue,
      background: darkBlue, //xx
      error: red,
      onPrimary: azure, //changes the color of text inside elevated button
      onSecondary: Colors.black,
      onSurface: Colors.white30,
      onBackground: whiteShade,
      onError: Colors.green,
      brightness: Brightness.light);
}
