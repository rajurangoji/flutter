import 'package:app_name/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    required this.items,
    super.key,
    this.headerTitle,
    this.headerSubtitle,
    this.headerAvatar,
    this.footer,
  });

  final List<AppDrawerItem> items;
  final String? headerTitle;
  final String? headerSubtitle;
  final Widget? headerAvatar;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return GFDrawer(
      color: AppTheme.background,
      child: Column(
        children: [
          GFDrawerHeader(
            decoration: const BoxDecoration(color: AppTheme.primary),
            currentAccountPicture: headerAvatar ??
                const CircleAvatar(
                  backgroundColor: AppTheme.onPrimary,
                  child: Icon(Icons.person, color: AppTheme.primary, size: 32),
                ),
            otherAccountsPictures: const [],
            centerAlign: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (headerTitle != null)
                  Text(
                    headerTitle!,
                    style: const TextStyle(
                      color: AppTheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                if (headerSubtitle != null)
                  Text(
                    headerSubtitle!,
                    style: TextStyle(
                      color: AppTheme.onPrimary.withValues(alpha: 0.75),
                      fontSize: 13,
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: items.map((item) => _DrawerTile(item: item)).toList(),
            ),
          ),
          if (footer != null)
            Padding(padding: const EdgeInsets.all(16), child: footer),
        ],
      ),
    );
  }
}

class AppDrawerItem {
  const AppDrawerItem({
    required this.label,
    required this.icon,
    this.onTap,
    this.isActive = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onTap;
  final bool isActive;
}

class _DrawerTile extends StatelessWidget {
  const _DrawerTile({required this.item});
  final AppDrawerItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        item.icon,
        color: item.isActive ? AppTheme.primary : AppTheme.mutedForeground,
      ),
      title: Text(
        item.label,
        style: TextStyle(
          color:
              item.isActive ? AppTheme.onBackground : AppTheme.mutedForeground,
          fontWeight:
              item.isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      tileColor: item.isActive
          ? AppTheme.primary.withValues(alpha: 0.1)
          : Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: item.onTap,
    );
  }
}
