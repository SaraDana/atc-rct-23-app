//IMPORT EXTERN APP
import 'package:app/core/di/locator.dart';
import 'package:app/features/deeplinks/app/cubits/deep_links/deeplink_cubit.dart';
import 'package:app/models/unit_model.dart';
//IMPORT INTERN APP
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class UnitTextContentWidget extends StatelessWidget {
  final Unit unit;
  const UnitTextContentWidget({Key? key, required this.unit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: DanaTheme.whiteColor,
      width: double.infinity,
      child: Html(
        data: unit.content,
        onLinkTap: (url, _, __, ___) async {
          locator<DeeplinkCubit>().openLink(deeplink: Uri.parse(url ?? ''));
        },
        style: {
          "*": Style(
            fontFamily: DanaTheme.bodyText1.fontFamily,
            fontSize: FontSize(18.0),
            color: DanaTheme.paletteDarkBlue,
          ),
          "h1": Style(fontSize: FontSize(36.0)),
          "h2": Style(fontSize: FontSize(28.0)),
          "h3": Style(fontSize: FontSize(20.0)),
          "h4": Style(fontSize: FontSize(18.0)),
          "h5": Style(fontSize: FontSize(16.0)),
          "h6": Style(fontSize: FontSize(14.0)),
        },
      ),
    );
  }
}
