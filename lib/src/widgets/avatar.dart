import 'package:app_name/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = GFSize.MEDIUM,
    this.shape = GFAvatarShape.circle,
    this.showBadge = false,
    this.badgeText,
  });

  final String? imageUrl;
  final String? initials;
  final double size;
  final GFAvatarShape shape;
  final bool showBadge;
  final String? badgeText;

  @override
  Widget build(BuildContext context) {
    final avatar = GFAvatar(
      size: size,
      shape: shape,
      backgroundColor: AppTheme.primary,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null
          ? Text(
              (initials ?? '?').toUpperCase(),
              style: TextStyle(
                color: AppTheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: size * 0.45,
              ),
            )
          : null,
    );

    if (!showBadge) return avatar;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        avatar,
        Positioned(
          right: 0,
          top: 0,
          child: GFBadge(
            text: badgeText ?? '',
            color: AppTheme.onBackground,
            textColor: AppTheme.primary,
            shape: GFBadgeShape.circle,
          ),
        ),
      ],
    );
  }
}
