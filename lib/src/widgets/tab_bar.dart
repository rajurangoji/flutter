import 'package:app_name/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({
    required this.tabs,
    required this.controller,
    super.key,
  });

  final List<Widget> tabs;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return GFTabBar(
      length: tabs.length,
      tabBarHeight: 48,
      tabBarColor: AppTheme.background,
      controller: controller,
      indicatorColor: AppTheme.primary,
      indicatorWeight: 3,
      labelColor: AppTheme.onBackground,
      unselectedLabelColor: AppTheme.mutedForeground,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      tabs: tabs,
    );
  }
}

class AppTabBarView extends StatelessWidget {
  const AppTabBarView({
    required this.controller,
    required this.children,
    super.key,
  });

  final TabController controller;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return GFTabBarView(
      controller: controller,
      children: children,
    );
  }
}
