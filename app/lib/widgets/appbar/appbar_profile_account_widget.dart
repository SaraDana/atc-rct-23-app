//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:app/utils/screen_size.dart';
import 'package:go_router/go_router.dart';

class AppBarProfileAccountWidget extends StatelessWidget {
  const AppBarProfileAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DanaTheme.paletteFPink,
      padding: EdgeInsets.only(top: 50, bottom: 20),
      height: 125,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
              icon: buildSvgImage('ic_back_button.svg', 22),
              color: DanaTheme.paletteDarkBlue,
              onPressed: () {
                context.pop();
              },
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.only(right: getScreenWidth(context) * 1 / 5),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  S.of(context).screenEditProfileBarTitle,
                  style: DanaTheme.textSuperSmallTextBold(
                      DanaTheme.paletteDarkBlue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
