import 'package:app_name/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    required this.content,
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    this.footer,
  });

  final Widget content;
  final String? title;
  final String? subtitle;
  final Widget? leading;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return GFCard(
      color: AppTheme.background,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: AppTheme.mutedForeground.withValues(alpha: 0.15),
        ),
      ),
      title: title != null || subtitle != null || leading != null
          ? GFListTile(
              avatar: leading,
              color: AppTheme.background,
              title: title != null
                  ? Text(
                      title!,
                      style: const TextStyle(
                        color: AppTheme.onBackground,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    )
                  : null,
              subTitle: subtitle != null
                  ? Text(
                      subtitle!,
                      style: const TextStyle(
                        color: AppTheme.mutedForeground,
                        fontSize: 13,
                      ),
                    )
                  : null,
            )
          : null,
      content: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            content,
            if (footer != null) ...[const SizedBox(height: 12), footer!],
          ],
        ),
      ),
      buttonBar: onTap != null
          ? GFButtonBar(
              children: [
                GFButton(
                  onPressed: onTap,
                  text: 'View',
                  color: AppTheme.primary,
                  textColor: AppTheme.onPrimary,
                  size: GFSize.SMALL,
                ),
              ],
            )
          : null,
    );
  }
}
