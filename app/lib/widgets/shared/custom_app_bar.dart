import 'package:flutter/material.dart';

import '../../styles/dana_theme.dart';
import '../../utils/images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? styleTitle;
  final Color? bgColor;
  final List<Widget>? actions;
  final Function()? onBackPressed;

  @override
  Size get preferredSize => Size.fromHeight(70.0);

  const CustomAppBar({
    Key? key,
    required this.title,
    this.styleTitle,
    this.bgColor,
    this.actions,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation:  bgColor == Colors.transparent ? 0 : null,
      backgroundColor: bgColor == null ? DanaTheme.paletteWhite : bgColor,
      leading: IconButton(
        icon: buildSvgImage('ic_back_button.svg', 22),
        color: DanaTheme.paletteDarkBlue,
        onPressed: onBackPressed,
      ),
      title: Text(
        title,
        style: styleTitle == null
            ? TextStyle(color: DanaTheme.paletteDarkBlue)
            : styleTitle,
      ),
      actions: actions,
    );
  }
}
