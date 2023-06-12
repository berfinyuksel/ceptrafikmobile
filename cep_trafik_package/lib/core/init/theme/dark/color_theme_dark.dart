import 'package:cep_trafik_package/core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class ColorThemeDark {
  static ColorThemeDark? _instance;
  static ColorThemeDark? get instance {
    return _instance ??= ColorThemeDark.init();
  }

  ColorThemeDark.init();

  final Color brown = 'a87e6f'.color;
  final Color green = const Color.fromARGB(192, 16, 197, 46);
  final Color red = 'CC2041'.color;
  final Color white = 'ffffff'.color;
  final Color grey = 'F1F3F8'.color;
  final Color lightGrey = 'F1F3F8'.color;
  final Color darkGrey = '535965'.color;
  final Color black = '020306'.color;
  final Color azure = '3fc4eb'.color;
  final Color darkBlue = '040f24'.color;
  final Color whiteShade = 'edf1fc'.color;
  final Color darkBlueSecondary = '19223C'.color;
  final Color darkBlueSecondaryShade = '2C3B5A'.color;

  ColorScheme get colorScheme => ColorScheme(
      primary: darkBlue, //xx
      primaryVariant: darkBlue,
      secondary: azure, //xx
      secondaryVariant: azure, //xx
      surface: darkBlue,
      background: darkBlue, //xx
      error: red,
      onPrimary: azure, //changes the color of text inside elevated button
      onSecondary: Colors.black,
      onSurface: Colors.white30,
      onBackground: whiteShade,
      onError: Colors.green,
      brightness: Brightness.dark);
}
