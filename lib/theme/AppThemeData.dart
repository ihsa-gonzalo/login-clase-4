import 'package:flutter/material.dart';

class AppThemeData {
  static Color primaryColor = Colors.blue;

  static ThemeData get materialTheme {
    return ThemeData(
        primaryColor: primaryColor,
        appBarTheme: AppBarTheme(color: primaryColor));
  }

  /*

  ThemeData _buildDefaultTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _buildDefaultTextTheme(base.textTheme),
    primaryTextTheme: _buildDefaultTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildDefaultTextTheme(base.accentTextTheme),
  );
}*/
}
