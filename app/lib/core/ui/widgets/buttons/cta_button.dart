import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class CtaButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color color;
  final Color textColor;
  const CtaButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.color,
      this.textColor = DanaTheme.whiteColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: DanaTheme.grayColor,
              blurRadius: 3,
              spreadRadius: 3,
            )
          ]),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
          padding: EdgeInsets.all(Sizes.p16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: DanaTheme.textBodyBold(textColor),
        ),
      ),
    );
  }
}
