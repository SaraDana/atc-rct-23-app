//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP

import 'package:app/generated/l10n.dart';
import 'package:app/models/program_model.dart';
import 'package:app/styles/dana_theme.dart';

class HeaderProgramDetailContentWidget extends StatelessWidget {
  final Program? program;
  final int? userUnits;
  const HeaderProgramDetailContentWidget(
      {Key? key, required this.program, required this.userUnits})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 1, child: Container(color: DanaTheme.paletteDarkBlue)),
              Expanded(
                  flex: 1, child: Container(color: DanaTheme.paletteWhite)),
            ],
          ),
          Container(
            height: 70,
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              child: Container(
                color: DanaTheme.paletteLightBlue,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "${program?.unitsRefs!.length ?? ""} ${S.of(context).pageProgramDetailUnitsOrProgress} ${userUnits! < 10 ? '0' : ''}$userUnits/${program!.unitsRefs!.length < 10 ? '0' : ''}${program?.unitsRefs!.length ?? ""}",
                    style: DanaTheme.textSmallTextBold(DanaTheme.paletteWhite),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
