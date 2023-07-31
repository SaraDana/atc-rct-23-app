//IMPORT EXTERN APP
import 'package:app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//IMPORT INTERN APP
import '../../config/constants.dart';
import '../../styles/dana_theme.dart';
import '../../utils/images.dart';

class ProgressAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final TextStyle? styleTitle;
  final Color? bgColor;
  final AppBarType? appBarType;
  final int? currentValue;
  final int? totalValue;
  final double? horizontalPadding;
  final List<Widget>? actions;
  final Function()? onBackPressed;
  final bool skip;

  @override
  final Size preferredSize;

  const ProgressAppBar({
    Key? key,
    this.title,
    this.styleTitle,
    this.bgColor,
    this.appBarType,
    this.currentValue,
    this.totalValue,
    this.horizontalPadding,
    this.actions,
    this.onBackPressed,
    this.skip = true,
  })  : preferredSize = const Size.fromHeight(80.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      width: double.infinity,
      child: Column(
        children: [
          if (this.skip)
            this.appBarType == AppBarType.ONLY_CLOSE
                ? AppBar(
                    leading: IconButton(
                      icon: buildSvgImage('ic_close.svg', 22),
                      color: DanaTheme.paletteDarkBlue,
                      onPressed: () {
                        context.goNamed(AppRoutes.home.name);
                      },
                    ),
                    shadowColor: Colors.transparent,
                    backgroundColor:
                        bgColor == null ? DanaTheme.paletteWhite : bgColor)
                : AppBar(
                    leading: IconButton(
                      icon: buildSvgImage('ic_back_button.svg', 22),
                      color: DanaTheme.paletteDarkBlue,
                      onPressed: onBackPressed,
                    ),
                    title: Container(
                      padding: EdgeInsets.only(right: 22),
                      child: Align(
                        child: Text(title ?? '',
                            style: styleTitle == null
                                ? TextStyle(color: DanaTheme.paletteDarkBlue)
                                : styleTitle),
                      ),
                    ),
                    shadowColor: Colors.transparent,
                    backgroundColor:
                        bgColor == null ? DanaTheme.paletteWhite : bgColor,
                    actions: actions,
                  ),
          Container(
            color: this.bgColor == null
                ? DanaTheme.paletteLightGrey
                : this.bgColor,
            padding: this.horizontalPadding == null
                ? EdgeInsets.all(0.0)
                : EdgeInsets.symmetric(horizontal: this.horizontalPadding!),
            child: (totalValue != null)
                ? Padding(
                    padding: EdgeInsets.only(top: this.skip ? 0 : 12.0),
                    child: Row(children: _buildProgrss()),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildProgrss() {
    final List<Widget> widgets = [];

    for (var i = 1; i <= this.totalValue!; i++) {
      widgets.add(Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.only(left: 4, right: 4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              height: 3,
              color: i > this.currentValue!
                  ? DanaTheme.paletteDanaPink
                  : DanaTheme.paletteOrange,
            ),
          ),
        ),
      ));
    }

    return widgets;
  }
}
