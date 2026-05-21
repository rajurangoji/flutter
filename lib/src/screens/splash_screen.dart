import 'dart:async';

import 'package:app_name/src/screens/onboarding_screen.dart';
import 'package:app_name/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const _splashDuration = Duration(seconds: 3);
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(_splashDuration, _navigate);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _navigate() {
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => const OnboardingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.primary,
      body: Center(
        child: Text('BUSKO', style: AppTheme.splashTextStyle),
      ),
    );
  }
}
