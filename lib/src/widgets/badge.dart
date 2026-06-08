import 'package:app_name/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

enum AppBadgeVariant { primary, dark, muted }

class AppBadge extends StatelessWidget {
  const AppBadge({
    required this.text,
    super.key,
    this.variant = AppBadgeVariant.primary,
    this.shape = GFBadgeShape.standard,
  });

  final String text;
  final AppBadgeVariant variant;
  final GFBadgeShape shape;

  @override
  Widget build(BuildContext context) {
    return GFBadge(
      text: text,
      color: _bgColor,
      textColor: _textColor,
      shape: shape,
      size: GFSize.SMALL,
    );
  }

  Color get _bgColor => switch (variant) {
        AppBadgeVariant.primary => AppTheme.primary,
        AppBadgeVariant.dark => AppTheme.onBackground,
        AppBadgeVariant.muted => AppTheme.mutedForeground,
      };

  Color get _textColor => switch (variant) {
        AppBadgeVariant.primary => AppTheme.onPrimary,
        AppBadgeVariant.dark => AppTheme.primary,
        AppBadgeVariant.muted => AppTheme.background,
      };
}

/// Overlays a numeric count badge on any widget (e.g. icon buttons).
class AppCountBadge extends StatelessWidget {
  const AppCountBadge({
    required this.child,
    required this.count,
    super.key,
    this.show = true,
  });

  final Widget child;
  final int count;
  final bool show;

  @override
  Widget build(BuildContext context) {
    if (!show || count <= 0) return child;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          right: -6,
          top: -6,
          child: GFBadge(
            text: count > 99 ? '99+' : '$count',
            color: AppTheme.primary,
            textColor: AppTheme.onPrimary,
            shape: GFBadgeShape.circle,
            size: GFSize.SMALL,
          ),
        ),
      ],
    );
  }
}
