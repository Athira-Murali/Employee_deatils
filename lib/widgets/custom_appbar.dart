import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/theme/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = "",
    this.actionButton,
    this.action1,
    this.action2,
    required this.onPress,
  });

  final String? title;
  final Widget? actionButton;
  final Widget? action1;
  final Widget? action2;

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      leadingWidth: 80,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: IconButton(
              onPressed: onPress,
              icon: SvgPicture.asset(
                "assets/svg/back.svg",
              ),
            ),
          ),
        ],
      ),
      title: Text(title!, style: AppTheme.lightTheme.textTheme.headlineLarge),
      actions: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: action1),
      ],
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
