import 'package:flutter/material.dart';

// For hex color usage, use this class
/* For Eas
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
*/

/****************************************************
 *  COLORS
 ****************************************************/

// Primarys
const primaryDarkestColor = Color(0xFF01251b);
const primaryDarkerColor = Color(0xFF045e45);
const primaryDarkColor = Color(0xFF068360);
const primaryColor = Color(0xFF09bc8a);
const primaryLightColor = Color(0xFF52d0ad);
const primaryLighterColor = Color(0xFF84ddc4);
const primaryLightestColor = Color(0xFFcdf1e7);

// Darks
const darkGreen = Color(0xFF004346);
const primaryDark = Color(0xFF172A3A);

// Greys

// Whites
const offsetWhite = Color(0xFFFAFAFA);
const primaryWhite = Color(0xFFFFFFFF);

/****************************************************
 *  FONT SIZE
 ****************************************************/