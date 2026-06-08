import 'package:app_name/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

enum AppButtonVariant { primary, secondary, outline, ghost }

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.variant = AppButtonVariant.primary,
    this.icon,
    this.isFullWidth = false,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final IconData? icon;
  final bool isFullWidth;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: isLoading ? null : onPressed,
      text: isLoading ? '' : label,
      icon: isLoading
          ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppTheme.onPrimary,
              ),
            )
          : icon != null
              ? Icon(icon, color: _textColor, size: 18)
              : null,
      color: _bgColor,
      textColor: _textColor,
      borderSide: _border,
      type: variant == AppButtonVariant.outline
          ? GFButtonType.outline2x
          : GFButtonType.solid,
      shape: GFButtonShape.standard,
      fullWidthButton: isFullWidth,
      size: GFSize.MEDIUM,
    );
  }

  Color get _bgColor => switch (variant) {
        AppButtonVariant.primary => AppTheme.primary,
        AppButtonVariant.secondary => AppTheme.onBackground,
        AppButtonVariant.outline => Colors.transparent,
        AppButtonVariant.ghost => Colors.transparent,
      };

  Color get _textColor => switch (variant) {
        AppButtonVariant.primary => AppTheme.onPrimary,
        AppButtonVariant.secondary => AppTheme.primary,
        AppButtonVariant.outline => AppTheme.primary,
        AppButtonVariant.ghost => AppTheme.mutedForeground,
      };

  BorderSide get _border => variant == AppButtonVariant.outline
      ? const BorderSide(color: AppTheme.primary, width: 2)
      : BorderSide.none;
}
