import 'package:app/config/constants.dart';
import 'package:app/cubits/program/program_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:app/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ContentUtils {
  String getTitlesContent(
    BuildContext context, {
    required ProfileLinks profileLink,
  }) {
    switch (profileLink) {
      case ProfileLinks.WELCOME:
        return '${S.of(context).pageLinkContentTitleProfileLinksWelcome}';
      case ProfileLinks.HELP:
        return '${S.of(context).pageLinkContentTitleProfileLinksHelp}';
      case ProfileLinks.COLLABORATORS:
        return '${S.of(context).pageLinkContentTitleProfileLinksCollaborators}';
      case ProfileLinks.PRIVACITY:
        return '${S.of(context).pageLinkContentTitleProfileLinksPrivacity}';
      case ProfileLinks.TERMS_AND_CONDITIONS:
        return S.of(context).pageLinkContentTitleProfileLinksTermsAndConditions;
      case ProfileLinks.SCIENCE_BEHIND_DANA:
        return S.of(context).pageLinkContentTitleProfileLinksScienceBehindDana;
      case ProfileLinks.COOKIES:
        return S.of(context).pageLinkContentTitleProfileLinksCookies;
      case ProfileLinks.MY_PROGRESS:
        return S.of(context).profilePageProgress;
      case ProfileLinks.ACCOUNT:
        return S.of(context).profilePageAccount;
      case ProfileLinks.HISTORY:
        return S.of(context).profilePageHistory;
      case ProfileLinks.SUBSCRIPTIONS:
        return S.of(context).profilePageSubscriptions;
      case ProfileLinks.UNSUBSCRIBE:
        return S.of(context).profilePageUnSubscribe;
      default:
        return '';
    }
  }

  void showBottomModalContent(
    BuildContext ctx, {
    required Function() onCloseTap,
    required Function() onRateButtonTap,
  }) {
    //TODO
    showModalBottomSheet<void>(
      context: ctx,
      isDismissible: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: getScreenHeight(context),
          color: Colors.transparent,
          child: Column(
            children: [
              Expanded(flex: 1, child: Text('')),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(DanaTheme.mediumPadding),
                    child: GestureDetector(
                      onTap: onCloseTap,
                      child: Icon(Icons.close, color: DanaTheme.paletteWhite),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.all(DanaTheme.bigPadding),
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(30.0),
                          topRight: const Radius.circular(30.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        S.of(context).pageProgramDetailHappyToHelp,
                        textAlign: TextAlign.center,
                        style: DanaTheme.textHeadlineSmall(
                            DanaTheme.paletteDarkBlue),
                      ),
                      Text(
                        S.of(context).pageProgramDetailValueProgram,
                        style: DanaTheme.textBody(DanaTheme.paletteDarkBlue),
                      ),
                      Container(height: 36),
                      RatingBar(
                        initialRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                          full: buildSvgImage('ic_star_full.svg'),
                          half: buildSvgImage('ic_star_full.svg'),
                          empty: buildSvgImage('ic_star_empty.svg'),
                        ),
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        onRatingUpdate: (rating) {
                          ctx
                              .read<ProgramCubit>()
                              .changeRating(rate: rating.toInt());
                        },
                      ),
                      Container(height: 40),
                      Container(
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
                        width: 200,
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(120),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  DanaTheme.paletteOrange, // foreground
                            ),
                            child: Text(
                                S.of(context).screenProgramDetailSendRateButton,
                                style:
                                    DanaTheme.textCta(DanaTheme.paletteWhite)),
                            onPressed: onRateButtonTap,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
