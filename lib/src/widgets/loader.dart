import 'package:app_name/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

enum AppLoaderVariant { circular, linear }

class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.variant = AppLoaderVariant.circular,
    this.size = GFSize.MEDIUM,
    this.percentage = 0,
  });

  final AppLoaderVariant variant;
  final double size;

  /// 0.0–1.0; only used by [AppLoaderVariant.linear].
  final double percentage;

  @override
  Widget build(BuildContext context) {
    if (variant == AppLoaderVariant.linear) {
      return GFProgressBar(
        percentage: percentage,
        backgroundColor: AppTheme.mutedForeground.withValues(alpha: 0.2),
        progressBarColor: AppTheme.primary,
        lineHeight: 6,
        radius: 4,
      );
    }

    return GFLoader(
      type: GFLoaderType.circle,
      loaderColorOne: AppTheme.primary,
      loaderColorTwo: AppTheme.onBackground,
      loaderColorThree: AppTheme.mutedForeground,
      size: size,
    );
  }
}
