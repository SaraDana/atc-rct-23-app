import 'package:app/models/unit_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/widgets/content/header_background_unit_deatil_widget.dart';
import 'package:flutter/material.dart';

class HeaderUnitDetailWidget extends StatelessWidget {
  final Unit unit;
  const HeaderUnitDetailWidget({Key? key, required this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: DanaTheme.paletteLightGrey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 30,
              left: DanaTheme.bodyPadding,
              right: DanaTheme.bodyPadding,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                unit.title!,
                style: DanaTheme.textHeadlineSmall(DanaTheme.paletteDarkBlue),
              ),
            ),
          ),
          unit.audio!.isEmpty ? HeaderBackgroundUnitDetailWidget() : Text('')
        ],
      ),
    );
  }
}
