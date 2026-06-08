import 'package:app_name/src/screens/onboarding_screen.dart';
import 'package:app_name/src/screens/splash_screen.dart';
import 'package:app_name/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child) => MaterialApp(home: child);

void main() {
  group('SplashScreen layout', () {
    testWidgets('background colour is #AAEC00', (tester) async {
      await tester.pumpWidget(_wrap(const SplashScreen()));

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, AppTheme.primary);
    });

    testWidgets('shows centred BUSKO text', (tester) async {
      await tester.pumpWidget(_wrap(const SplashScreen()));

      expect(find.text('BUSKO'), findsOneWidget);
      expect(find.byType(Center), findsWidgets);
    });

    testWidgets('BUSKO text has correct style', (tester) async {
      await tester.pumpWidget(_wrap(const SplashScreen()));

      final text = tester.widget<Text>(find.text('BUSKO'));
      expect(text.style?.fontWeight, FontWeight.bold);
      expect(text.style?.color, AppTheme.onPrimary);
    });

    testWidgets('no AppBar present', (tester) async {
      await tester.pumpWidget(_wrap(const SplashScreen()));

      expect(find.byType(AppBar), findsNothing);
    });
  });

  group('SplashScreen navigation', () {
    testWidgets('navigates to OnboardingScreen after 3 seconds',
        (tester) async {
      await tester.pumpWidget(_wrap(const SplashScreen()));

      expect(find.byType(SplashScreen), findsOneWidget);
      expect(find.byType(OnboardingScreen), findsNothing);

      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      expect(find.byType(OnboardingScreen), findsOneWidget);
      expect(find.byType(SplashScreen), findsNothing);
    });

    testWidgets('uses pushReplacement — back does not return to splash',
        (tester) async {
      await tester.pumpWidget(_wrap(const SplashScreen()));

      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      expect(find.byType(OnboardingScreen), findsOneWidget);

      final navigator = tester.state<NavigatorState>(find.byType(Navigator));
      expect(navigator.canPop(), isFalse);
    });

    testWidgets('does not navigate before 3 seconds elapse', (tester) async {
      await tester.pumpWidget(_wrap(const SplashScreen()));

      await tester.pump(const Duration(milliseconds: 2999));
      await tester.pump();

      expect(find.byType(SplashScreen), findsOneWidget);
      expect(find.byType(OnboardingScreen), findsNothing);
    });
  });

  group('SplashScreen timer safety', () {
    testWidgets('disposes timer cleanly — no exception on early unmount',
        (tester) async {
      await tester.pumpWidget(_wrap(const SplashScreen()));

      // Replace widget before timer fires
      await tester.pumpWidget(_wrap(const SizedBox()));
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      // No exception = test passes
    });
  });
}
