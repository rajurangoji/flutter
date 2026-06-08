# BUSKO-001 — Splash Screen & App Theme Configuration

## Story

As a user opening the BUSKO app for the first time,
I want to see a branded splash screen with the app name,
So that the app feels polished and professional before landing on onboarding.

## Context

The app currently launches directly into `HomeScreen`. We need:
1. A splash screen matching the brand design (lime green background, bold BUSKO wordmark).
2. Automatic navigation to the onboarding start screen after 3 seconds.
3. App-wide theme colours configured to match the design system.

## Design

- Background: `#AAEC00` (lime green)
- Foreground / text: `#030712` (near-black)
- Muted foreground: `#6B7280` (grey)
- Surface / background: `#FFFFFF`
- "BUSKO" centred, bold, large (~72sp), colour `#030712`
- No app bar, full-screen
- After 3 000 ms → push replace to `OnboardingScreen`

## Acceptance Criteria

1. **AC-1** — Splash screen displays for exactly 3 seconds (±200 ms tolerance).
2. **AC-2** — "BUSKO" text is centred horizontally and vertically on the screen.
3. **AC-3** — Background colour is `#AAEC00`; text colour is `#030712`.
4. **AC-4** — After the timer expires the app navigates to `OnboardingScreen` (pushReplacement so back returns nothing).
5. **AC-5** — App theme defines: `primary = #AAEC00`, `onPrimary = #030712`, `background = #FFFFFF`, `onBackground = #030712`.
6. **AC-6** — No visible debug banner.
7. **AC-7** — Widget disposes the timer when removed from tree (no timer leak).

## Out of Scope

- Onboarding screen content (separate story).
- Animations / transitions beyond the default page route.
- Deep-link or cold-start shortcut handling.

## Stack

- Flutter / Dart
- `MaterialApp` with `ThemeData` (Material 3)
- `StatefulWidget` + `Timer` for splash delay
