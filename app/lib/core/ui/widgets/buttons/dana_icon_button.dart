import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:flutter/material.dart';

class DanaIconButton extends StatelessWidget {
  const DanaIconButton({
    this.onPressed,
    required this.text,
    required this.imagePath,
    this.color,
  }) : super();

  final VoidCallback? onPressed;
  final String text;
  final String imagePath;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: DanaTheme.paddingSignInButtons),
      child: Container(
        decoration: BoxDecoration(
          color: DanaTheme.paletteWhite,
          borderRadius: BorderRadius.circular(162),
          boxShadow: [
            BoxShadow(
              blurRadius: 19,
              offset: Offset(0, 4),
              color: DanaTheme.paletteGreyShadow.withOpacity(.2),
              spreadRadius: 0,
            )
          ],
        ),
        width: double.infinity,
        height: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(120),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: color ?? DanaTheme.paletteWhite, // foreground
            ),
            icon: buildSvgImage(imagePath, 22),
            label: Text(text,
                style: DanaTheme.textCta(
                    color != null ? Colors.white : DanaTheme.paletteDarkBlue)),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
