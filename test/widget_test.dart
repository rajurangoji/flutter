import 'package:app_name/main.dart';
import 'package:app_name/src/screens/home_screen.dart';
import 'package:app_name/src/screens/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('initial route is SplashScreen, not HomeScreen', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.byType(HomeScreen), findsNothing);
  });
}
