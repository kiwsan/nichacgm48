import 'package:flutter/material.dart';

Color grey100TextColor = HexColor("#aeaeae");
Color grey800TextColor = HexColor("#707070");
Color yellow800TextColor = HexColor("#ffcb00");

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
