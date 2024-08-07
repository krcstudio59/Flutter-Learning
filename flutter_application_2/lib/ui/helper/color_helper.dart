import 'dart:ui';

import 'package:flutter/material.dart';

class UIColorHelper {
  static const Color PRIMARY_COLOR = Color(0xFF1A237E);
  static const Color LIGHT_COLOR = Color(0xFF534BAE);
  static const Color DARK_COLOR = Color(0xFF000051);
  static const Color TEXT_COLOR = Color(0xFFFFFFFF);
}
//UIColorHelper.DEGISKEN_ADI // Bu şekilde kullanabilirsiniz.

class UIGradientHelper {
  static const LinearGradient GradientBG = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color.fromARGB(255, 12, 4, 38), Color.fromARGB(255, 186, 0, 255)]);
}