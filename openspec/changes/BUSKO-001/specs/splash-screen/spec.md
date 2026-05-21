# Spec: Splash Screen & App Theme — BUSKO-001

**Feature:** splash-screen  
**Story:** BUSKO-001  
**Status:** draft

---

## 1. Functional Scenarios

### F-01 — Splash renders correctly
**Given** the app launches  
**When** `SplashScreen` is built  
**Then** the scaffold background is `Color(0xFFAAEC00)`  
**And** a centred `Text('BUSKO')` widget exists with `color = Color(0xFF030712)` and `fontWeight = FontWeight.bold`  
**And** no `AppBar` is present  
**And** `debugShowCheckedModeBanner` is false

### F-02 — Timer navigates after 3 seconds
**Given** `SplashScreen` is mounted  
**When** 3 000 ms elapse  
**Then** the router calls `pushReplacement` to `OnboardingScreen`  
**And** pressing back on `OnboardingScreen` does NOT return to `SplashScreen`

### F-03 — Theme primary colour
**Given** the `MaterialApp` is built  
**When** `Theme.of(context).colorScheme.primary` is read anywhere  
**Then** its value is `Color(0xFFAAEC00)`

### F-04 — Theme background and foreground
**Given** the `MaterialApp` is built  
**Then** `colorScheme.surface` (background) = `Color(0xFFFFFFFF)`  
**And** `colorScheme.onSurface` = `Color(0xFF030712)`  
**And** `colorScheme.onPrimary` = `Color(0xFF030712)`

### F-05 — Muted foreground token available
**Given** the app theme  
**Then** a named constant or extension value `mutedForeground = Color(0xFF6B7280)` is accessible for use in child widgets

---

## 2. Edge-Case Scenarios

### E-01 — Splash disposes timer on early unmount
**Given** `SplashScreen` is mounted  
**When** it is removed from the tree before 3 000 ms elapse (e.g. hot-restart, forced navigation in tests)  
**Then** `Timer.cancel()` is called in `dispose()`  
**And** no `setState called after dispose` exception is thrown

### E-02 — Multiple rapid rebuilds do not create duplicate timers
**Given** `SplashScreen`'s `initState` creates exactly one `Timer`  
**When** `setState` is called or the widget rebuilds  
**Then** no additional timers are created (timer is created only in `initState`)

### E-03 — Navigation target (`OnboardingScreen`) exists and renders without error
**Given** the 3 second timer fires  
**When** `OnboardingScreen` is pushed  
**Then** no `RouteNotFound` or widget build exception is thrown  
**And** `OnboardingScreen` renders a non-empty widget tree

### E-04 — Very slow device does not double-navigate
**Given** the timer fires but the frame has not been rendered yet  
**When** `Navigator.pushReplacement` is called  
**Then** it is called exactly once (guard with `mounted` check)

---

## 3. Security Scenarios

### S-01 — No sensitive data on splash
**Given** the splash screen  
**Then** it contains no user data, tokens, API keys, or PII  
**And** no network calls are made during the splash display

### S-02 — No deep-link injection via splash
**Given** the app receives a deep-link intent while the splash is showing  
**Then** the splash completes its normal 3-second lifecycle before any route handling  
**And** the splash does not parse or act on the intent payload

---

## 4. Invariants

| # | Invariant |
|---|-----------|
| I-01 | `SplashScreen` is a `StatefulWidget`; timer lives in `State` only |
| I-02 | Navigation uses `pushReplacement` — back stack must not contain splash |
| I-03 | Theme colours defined in one place (`app_theme.dart`) and imported by `main.dart` |
| I-04 | No hardcoded colour literals outside `app_theme.dart` |
| I-05 | `OnboardingScreen` is a stub (empty scaffold with title) acceptable for this story |

---

## 5. Non-Functional

- **NF-01** — Splash timer precision: ±200 ms on a standard device.
- **NF-02** — No visible jank; the splash is a static layout with no heavy computation.
- **NF-03** — Widget test coverage ≥ 95% for `SplashScreen` and theme configuration.

---

## 6. Out of Scope

- Onboarding screen content (separate story)
- Lottie/animation on splash
- Platform-specific native splash (android/LaunchTheme.xml) — Flutter layer only
