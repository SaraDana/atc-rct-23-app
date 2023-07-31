import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const LoginButtonWidget(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(162),
        boxShadow: [
          BoxShadow(
              blurRadius: 19,
              offset: Offset(0, 4),
              color: DanaTheme.paletteOrange.withOpacity(.2),
              spreadRadius: 0)
        ],
      ),
      width: double.infinity,
      height: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(120),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: DanaTheme.paletteOrange, // foreground
          ),
          child: Text(text, style: DanaTheme.textCta(DanaTheme.paletteWhite)),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
