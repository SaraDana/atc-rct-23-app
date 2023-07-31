import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class DanaTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color textColor;
  const DanaTextButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.textColor = DanaTheme.paletteDarkBlue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: DanaTheme.textBodyBold(textColor),
      ),
    );
  }
}
