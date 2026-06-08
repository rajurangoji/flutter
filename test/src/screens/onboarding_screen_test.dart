import 'package:app_name/src/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingScreen', () {
    testWidgets('renders without exception', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: OnboardingScreen()),
      );

      expect(find.byType(OnboardingScreen), findsOneWidget);
    });

    testWidgets('shows AppBar with title Onboarding', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: OnboardingScreen()),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Onboarding'), findsOneWidget);
    });
  });
}
