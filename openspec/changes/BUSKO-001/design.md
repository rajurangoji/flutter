# Design: Splash Screen & App Theme — BUSKO-001

## 1. Component Map

```
lib/
├── main.dart                          ← updated: theme wired, initial route = SplashScreen
├── src/
│   ├── screens/
│   │   ├── splash_screen.dart         ← NEW
│   │   └── onboarding_screen.dart     ← NEW (stub)
│   └── theme/
│       └── app_theme.dart             ← NEW: all colour tokens + ThemeData factory
test/
└── src/
    └── screens/
        ├── splash_screen_test.dart    ← NEW
        └── onboarding_screen_test.dart← NEW (minimal)
```

---

## 2. Widget Contract

### `SplashScreen`

```dart
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
}
```

| Concern | Detail |
|---------|--------|
| Type | `StatefulWidget` |
| Lifecycle | `initState` → starts `Timer(3s, _navigate)` |
| Dispose | cancels timer |
| Navigation | `Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const OnboardingScreen()))` |
| Guard | `if (mounted)` before `pushReplacement` |
| Background | `Scaffold(backgroundColor: AppTheme.primary)` |
| Body | `Center(child: Text('BUSKO', style: AppTheme.splashTextStyle))` |
| AppBar | none |

### `OnboardingScreen` (stub)

```dart
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
}
```

| Concern | Detail |
|---------|--------|
| Type | `StatelessWidget` |
| Body | `Scaffold` with `AppBar(title: Text('Onboarding'))` — empty body |
| Purpose | Navigation target for BUSKO-001; content is out of scope |

---

## 3. Theme Contract

### `AppTheme` (lib/src/theme/app_theme.dart)

```dart
abstract final class AppTheme {
  // Colour tokens
  static const Color primary          = Color(0xFFAAEC00);
  static const Color onPrimary        = Color(0xFF030712);
  static const Color background       = Color(0xFFFFFFFF);
  static const Color onBackground     = Color(0xFF030712);
  static const Color mutedForeground  = Color(0xFF6B7280);

  // Text styles
  static const TextStyle splashTextStyle = TextStyle(
    fontSize: 72,
    fontWeight: FontWeight.bold,
    color: onPrimary,
    letterSpacing: 2,
  );

  // ThemeData factory
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
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
```

---

## 4. Navigation Contract

| From | Trigger | To | Method |
|------|---------|-----|--------|
| `SplashScreen` | Timer(3 000 ms) | `OnboardingScreen` | `pushReplacement` |

**Back stack after navigation:** `[OnboardingScreen]` — splash is NOT in the stack.

---

## 5. main.dart Changes

```dart
// Before
home: const HomeScreen(),
theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo), useMaterial3: true),

// After
home: const SplashScreen(),
theme: AppTheme.lightTheme,
```

---

## 6. Resources Required

| Resource | Type | New | Notes |
|----------|------|-----|-------|
| — | — | No | Pure Flutter layer; no new infra |

---

## 7. Dependencies

No new `pubspec.yaml` dependencies required. Uses only `flutter/material.dart`.
