import 'package:app_name/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum AppChipVariant { filled, outline, muted }

class AppChip extends StatelessWidget {
  const AppChip({
    required this.label,
    super.key,
    this.variant = AppChipVariant.filled,
    this.avatar,
    this.onDeleted,
    this.onTap,
  });

  final String label;
  final AppChipVariant variant;
  final Widget? avatar;
  final VoidCallback? onDeleted;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(color: _textColor, fontSize: 13),
        ),
        avatar: avatar,
        backgroundColor: _bgColor,
        side: _border,
        deleteIcon: onDeleted != null
            ? Icon(Icons.close, size: 16, color: _textColor)
            : null,
        onDeleted: onDeleted,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Color get _bgColor => switch (variant) {
        AppChipVariant.filled => AppTheme.primary,
        AppChipVariant.outline => Colors.transparent,
        AppChipVariant.muted =>
          AppTheme.mutedForeground.withValues(alpha: 0.12),
      };

  Color get _textColor => switch (variant) {
        AppChipVariant.filled => AppTheme.onPrimary,
        AppChipVariant.outline => AppTheme.primary,
        AppChipVariant.muted => AppTheme.mutedForeground,
      };

  BorderSide get _border => switch (variant) {
        AppChipVariant.outline =>
          const BorderSide(color: AppTheme.primary, width: 1.5),
        _ => BorderSide.none,
      };
}
