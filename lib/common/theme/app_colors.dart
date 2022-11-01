import 'package:flutter/material.dart';

// TODO apply theme system

class AppColors {
  static ColorScheme of(BuildContext context) {
    return Theme.of(context).colorScheme;
  }
}

extension ColorSchemeExt on ColorScheme {
  Color get text => Color(0xFF444444);
  Color get textLight => Color(0xFF888888);
  Color get grey => Color(0xFFBBBBBB);
  Color get lightGrey => Color(0xFFDDDDDD);
  Color get success => Colors.green;
  Color get info => Colors.blue;
  Color get record => Colors.red;
  Color get onRecord => Colors.white;
  Color get surfaceLight => Color(0xFFFFFFFF);
  Color get surfaceDark => Color(0xFFEFEFEF);
}
