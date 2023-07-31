import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/dana_theme.dart';
import '../../utils/images.dart';

class SocialAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? styleTitle;
  final Color? bgColor;
  final List<Widget>? actions;
  final bool showBackButton;
  final bool showLogo;
  final bool? centerTitle;
  final Icon? decoratorIcon;
  final Widget? decoratorIconWidget;

  @override
  Size get preferredSize => Size.fromHeight(170.0);

  const SocialAppBar(
      {Key? key,
      required this.title,
      this.styleTitle,
      this.bgColor,
      this.actions,
      this.showBackButton = false,
      this.showLogo = true,
      this.centerTitle = true,
      this.decoratorIcon,
      this.decoratorIconWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 40,
              color: DanaTheme.bgAppbar,
              child: _titleAppBar(context)),
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/bg_header.png',
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleAppBar(BuildContext context) {
    return Container(
      height: 40,
      color: DanaTheme.bgAppbar,
      child: Row(children: [
        if (showBackButton)
          IconButton(
            icon: buildSvgImage('ic_back_button.svg', 22),
            color: DanaTheme.paletteDarkBlue,
            onPressed: () {
              Navigator.of(context).maybePop();
            },
          ),
        if (showLogo)
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 50),
              margin: const EdgeInsets.only(left: 20),
              child: Center(
                child: SvgPicture.asset('assets/images/logo.svg',
                    height: 35, fit: BoxFit.cover),
              ),
            ),
          ),
        if (title.isNotEmpty)
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(right: 35),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: (centerTitle == true)
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                    if (decoratorIcon != null)
                      IconButton(
                        icon: decoratorIcon!,
                        color: DanaTheme.paletteDarkBlue,
                        onPressed: () {},
                      ),
                    if (decoratorIconWidget != null) decoratorIconWidget!,
                    Text(
                      title,
                      style: styleTitle == null
                          ? TextStyle(
                              color: DanaTheme.paletteDarkBlue,
                              fontWeight: FontWeight.bold)
                          : styleTitle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: actions ?? [],
          ),
        ),
      ]),
    );
  }
}
