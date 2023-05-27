import 'package:flutter/material.dart';
import 'package:whats/common/extension/Custom_theme_extension.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  final double? minWidth;

  const CustomIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.iconColor,
    this.minWidth,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      splashColor: Colors.transparent,
      splashRadius: iconSize ?? 22,
      iconSize: iconSize ?? 22,
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(minWidth: minWidth ?? 40),
      icon: Icon(
        icon,
        color: iconColor ?? context.theme.greyColor,
      ),
    );
  }
}
