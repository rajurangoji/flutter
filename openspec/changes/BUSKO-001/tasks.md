# Tasks: Splash Screen & App Theme — BUSKO-001

Spec: `openspec/changes/BUSKO-001/specs/splash-screen/spec.md`  
Design: `openspec/changes/BUSKO-001/design.md`

---

## Task 1 — AppTheme colour tokens and ThemeData factory

**File:** `lib/src/theme/app_theme.dart`  
**Test:** `test/src/theme/app_theme_test.dart`  
**Spec refs:** F-03, F-04, F-05, I-03, I-04

- [x] RED: write failing unit tests asserting all colour constants and `lightTheme` colour scheme values
- [x] GREEN: create `lib/src/theme/app_theme.dart` with `AppTheme` abstract final class (tokens + `splashTextStyle` + `lightTheme`)
- [x] REFACTOR: confirm no colour literals exist outside this file

---

## Task 2 — SplashScreen widget

**File:** `lib/src/screens/splash_screen.dart`  
**Test:** `test/src/screens/splash_screen_test.dart`  
**Spec refs:** F-01, F-02, E-01, E-02, E-04, I-01, I-02

- [x] RED: write widget tests for:
  - background colour = `0xFFAAEC00`
  - centred `Text('BUSKO')` with correct style
  - no `AppBar` present
  - after `pump(Duration(seconds: 3))`, navigates to `OnboardingScreen`
  - `pushReplacement` used (back from `OnboardingScreen` does not return to splash)
  - timer cancelled on dispose (no exception on early unmount)
  - `mounted` guard prevents double-navigate
- [x] GREEN: implement `SplashScreen` as `StatefulWidget` with `Timer` in `initState`, dispose cancels timer, navigate with `mounted` guard
- [x] REFACTOR: extract magic duration to a private const; confirm single timer invariant

---

## Task 3 — OnboardingScreen stub

**File:** `lib/src/screens/onboarding_screen.dart`  
**Test:** `test/src/screens/onboarding_screen_test.dart`  
**Spec refs:** E-03, I-05

- [x] RED: write widget test asserting `OnboardingScreen` renders without exception and shows an `AppBar` titled 'Onboarding'
- [x] GREEN: create `OnboardingScreen` as `StatelessWidget` with `Scaffold(appBar: AppBar(title: Text('Onboarding')))`
- [x] REFACTOR: none expected

---

## Task 4 — Wire main.dart: theme + initial route

**File:** `lib/main.dart`  
**Test:** `test/widget_test.dart` (update smoke test)  
**Spec refs:** F-03, F-04, AC-6

- [x] RED: update `test/widget_test.dart` — pump `MyApp`, assert `SplashScreen` is present (not `HomeScreen`), no debug banner
- [x] GREEN: update `main.dart` — replace `HomeScreen` with `SplashScreen`, replace inline `ThemeData` with `AppTheme.lightTheme`, import both
- [x] REFACTOR: remove now-unused `Colors.indigo` import if present; confirm `debugShowCheckedModeBanner: false` is set

---

## Quality Gate (mandatory — runs after all tasks)

```
flutter test --coverage
flutter analyze
```

Pass criteria:
- Coverage ≥ 95% for new files
- Zero analyzer violations
- No `setState called after dispose` warnings in test output
