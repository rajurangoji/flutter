import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const Color primary = Color(0xFFAAEC00);
  static const Color onPrimary = Color(0xFF030712);
  static const Color background = Color(0xFFFFFFFF);
  static const Color onBackground = Color(0xFF030712);
  static const Color mutedForeground = Color(0xFF6B7280);

  static const TextStyle splashTextStyle = TextStyle(
    fontSize: 72,
    fontWeight: FontWeight.bold,
    color: onPrimary,
    letterSpacing: 2,
  );

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: primary,
          onPrimary: onPrimary,
          secondary: primary,
          onSecondary: onPrimary,
          error: Color(0xFFB00020),
          onError: Color(0xFFFFFFFF),
          surface: background,
          onSurface: onBackground,
        ),
      );
}
