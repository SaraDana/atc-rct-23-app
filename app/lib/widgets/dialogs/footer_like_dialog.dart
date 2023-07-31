//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/models/unit_model.dart';

//TODO: This widget is not used
class FooterLikeDialog extends StatefulWidget {
  final Unit unit;
  const FooterLikeDialog({
    Key? key,
    required this.unit,
  }) : super(key: key);

  @override
  State<FooterLikeDialog> createState() => _FooterLikeDialogState();
}

class _FooterLikeDialogState extends State<FooterLikeDialog> {
  bool? useful;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Wrap(
        runSpacing: 15,
        alignment: WrapAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: DanaTheme.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Text(
                  S.of(context).dialogFooterLikeTitle,
                  style: DanaTheme.bannerTitle1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    _setUsefulValue(true);
                  },
                  child: Card(
                    color: DanaTheme.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                    ),
                    child: Container(
                      height: 60,
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: DanaTheme.paletteGreyTonesMediumGrey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(45),
                                ),
                              ),
                              child: buildSvgImage(
                                  useful == true
                                      ? 'ic_thumb_up_selected.svg'
                                      : 'ic_thumb_up_unselected.svg',
                                  45),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              S.of(context).dialogFooterLikeAfirmative,
                              style: DanaTheme.bannerTitle2.copyWith(
                                color: DanaTheme.paletteDarkBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _setUsefulValue(false);
                  },
                  child: Card(
                    color: DanaTheme.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                    ),
                    child: Container(
                      height: 60,
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: DanaTheme.paletteGreyTonesMediumGrey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(45),
                                ),
                              ),
                              child: buildSvgImage(
                                useful == false
                                    ? 'ic_thumb_down_selected.svg'
                                    : 'ic_thumb_down_unselected.svg',
                                45,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              S.of(context).dialogFooterLikeNegative,
                              style: DanaTheme.bannerTitle2.copyWith(
                                color: DanaTheme.paletteDarkBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _setUsefulValue(bool value) {
    DanaAnalyticsService.trackUnitRating(widget.unit.id, value,
        widget.unit.audio != null && widget.unit.audio!.isNotEmpty);
    setState(() {
      useful = value;
    });
  }
}
