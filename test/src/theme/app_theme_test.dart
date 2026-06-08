import 'package:app_name/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTheme colour tokens', () {
    test('primary is #AAEC00', () {
      expect(AppTheme.primary, const Color(0xFFAAEC00));
    });

    test('onPrimary is #030712', () {
      expect(AppTheme.onPrimary, const Color(0xFF030712));
    });

    test('background is #FFFFFF', () {
      expect(AppTheme.background, const Color(0xFFFFFFFF));
    });

    test('onBackground is #030712', () {
      expect(AppTheme.onBackground, const Color(0xFF030712));
    });

    test('mutedForeground is #6B7280', () {
      expect(AppTheme.mutedForeground, const Color(0xFF6B7280));
    });
  });

  group('AppTheme.lightTheme', () {
    test('colorScheme.primary matches token', () {
      expect(AppTheme.lightTheme.colorScheme.primary, AppTheme.primary);
    });

    test('colorScheme.onPrimary matches token', () {
      expect(AppTheme.lightTheme.colorScheme.onPrimary, AppTheme.onPrimary);
    });

    test('colorScheme.surface matches background token', () {
      expect(AppTheme.lightTheme.colorScheme.surface, AppTheme.background);
    });

    test('colorScheme.onSurface matches onBackground token', () {
      expect(AppTheme.lightTheme.colorScheme.onSurface, AppTheme.onBackground);
    });

    test('useMaterial3 is true', () {
      expect(AppTheme.lightTheme.useMaterial3, isTrue);
    });
  });

  group('AppTheme.splashTextStyle', () {
    test('fontSize is 72', () {
      expect(AppTheme.splashTextStyle.fontSize, 72);
    });

    test('fontWeight is bold', () {
      expect(AppTheme.splashTextStyle.fontWeight, FontWeight.bold);
    });

    test('color is onPrimary', () {
      expect(AppTheme.splashTextStyle.color, AppTheme.onPrimary);
    });
  });
}
