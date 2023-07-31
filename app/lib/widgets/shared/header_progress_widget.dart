import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class HeaderProgressWidget extends StatefulWidget {
  final int currentValue;
  final int totalValue;
  final Color? bgColor;
  final double? horizontalPadding;

  const HeaderProgressWidget(
      {Key? key,
      required this.currentValue,
      required this.totalValue,
      this.bgColor,
      this.horizontalPadding})
      : super(key: key);

  @override
  _HeaderProgressWidgetState createState() => _HeaderProgressWidgetState();
}

class _HeaderProgressWidgetState extends State<HeaderProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          widget.bgColor == null ? DanaTheme.paletteLightGrey : widget.bgColor,
      padding: widget.horizontalPadding == null
          ? EdgeInsets.all(0.0)
          : EdgeInsets.symmetric(horizontal: widget.horizontalPadding!),
      child: Row(children: [
        // ignore: unused_local_variable
        for (var i = 0; i < widget.totalValue; i++)
          Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.only(left: 4, right: 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                        height: 3,
                        color: i > widget.currentValue
                            ? DanaTheme.paletteDanaPink
                            : DanaTheme.paletteOrange),
                  )))
      ]),
    );
  }
}
