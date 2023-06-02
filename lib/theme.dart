import 'package:flutter/material.dart';

class AppTheme {
  static Color HexColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static const Color bodyColor = Color(0xFFF5F5F5);
  static const Color bodyColorDark = Color(0xFF131313);
  static const Color appColor = Color(0xFFE4AA3D);
  static const Color inpuStyle = Color(0xFFF5F5F5);
  static const Color nearlyBlack = Color(0xFF000000);
  static const Color deactivatedText =
      Color(0xFF979797); // Color.fromARGB(255, 109, 109, 109);
  static const Color myGrey = Color.fromARGB(255, 221, 220, 220);
  static const Color successColor = Color.fromARGB(255, 0, 148, 62);
  static const Color errorColor = Color.fromARGB(255, 255, 0, 0);
  static const double fontSize = 15;
  static const Color border = Color(0xFFE8E8E8);
  static const Color darkGray = Color(0xFFAAAFB5);
  static const Color fadeTxt = Color(0xFF919191);
  static const Color greyTxt = Color(0xFFA3A3A3);
  static const double appBarH = 78.0;
  static const double bottomNavH = 82.4;
  static const double authHeadingH = 225.0;
  // static const TextStyle inpuStyle = TextStyle(fontSize: 20.0);
}
