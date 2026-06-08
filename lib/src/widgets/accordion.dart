import 'package:app_name/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class AppAccordion extends StatelessWidget {
  const AppAccordion({
    required this.title,
    required this.content,
    super.key,
    this.initiallyExpanded = false,
    this.titleIcon,
  });

  final String title;
  final Widget content;
  final bool initiallyExpanded;
  final IconData? titleIcon;

  @override
  Widget build(BuildContext context) {
    return GFAccordion(
      showAccordion: initiallyExpanded,
      titleChild: Row(
        children: [
          if (titleIcon != null) ...[
            Icon(titleIcon, color: AppTheme.primary, size: 20),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppTheme.onBackground,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
      contentChild: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: DefaultTextStyle(
          style: const TextStyle(
            color: AppTheme.mutedForeground,
            fontSize: 14,
            height: 1.5,
          ),
          child: content,
        ),
      ),
      collapsedIcon: const Icon(Icons.add, color: AppTheme.primary),
      expandedIcon: const Icon(Icons.remove, color: AppTheme.primary),
      collapsedTitleBackgroundColor: AppTheme.background,
      expandedTitleBackgroundColor: AppTheme.background,
      contentBackgroundColor: AppTheme.background,
      margin: const EdgeInsets.symmetric(vertical: 4),
      titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
