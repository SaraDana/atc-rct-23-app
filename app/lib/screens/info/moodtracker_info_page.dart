//IMPORT EXTERN APP
import 'package:app/widgets/info/moodtracker/moodtracker_expansion_rules_widget.dart';
import 'package:flutter/material.dart';

//IMPORT LOCAL APP
import 'package:app/generated/l10n.dart';
import 'package:app/widgets/shared/social_app_bar.dart';
import 'package:app/utils/images.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoodtrackerInfoPage extends StatefulWidget {
  MoodtrackerInfoPage({Key? key}) : super(key: key);

  @override
  State<MoodtrackerInfoPage> createState() => _MoodtrackerInfoPage();
}

class _MoodtrackerInfoPage extends State<MoodtrackerInfoPage> {
  final double intraSectionMargin = 20;
  final double interSectionMargin = 25;
  final double listItemsMargin = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DanaTheme.whiteColor,
      body: Column(
        children: [
          Container(
            height: 50,
            color: DanaTheme.bgAppbar,
          ),
          SocialAppBar(
            title: S.of(context).widgetMoodTrackerMoodSectionTitle,
            bgColor: DanaTheme.bgAppbar,
            showBackButton: true,
            showLogo: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: _getInfo(context, 50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getInfo(BuildContext context, double topInset) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).moodTrackerInfoPageTitle,
            style: DanaTheme.textBodyBold(DanaTheme.paletteDarkBlue),
          ),
          _getSectionDetail(
            S.of(context).moodTrackerInfoPageDetail1,
          ),
          _getSectionDetail(
            S.of(context).moodTrackerInfoPageDetail2,
          ),
          MoodTrackerExpansionsWidget(
              intraSectionMargin: intraSectionMargin,
              listItemsMargin: listItemsMargin),
          _getSectionDetail(
            S.of(context).moodTrackerInfoPageDetail3,
          ),
          24.h.verticalSpace,
          Text(
            S.of(context).widgetMoodTrackerMoodSectionTitle,
            style: DanaTheme.textBodyBold(DanaTheme.paletteDarkBlue),
          ),
          _getSectionDetail(
            S.of(context).moodTrackerInfoPageEvolucionDetail,
          ),
          _getSectionImage("vinculos_graph_image.svg"),
          _getSectionDetail(
              S.of(context).moodTrackerInfoPageVinculosGraphDetail),
          _getSectionImage("emotion_graph_image.svg"),
          _getSectionDetail(
              S.of(context).moodTrackerInfoPageEmotionGraphDetail),
          24.h.verticalSpace,
          Text(
            S.of(context).miDiarioDeEmociones,
            style: DanaTheme.textBodyBold(DanaTheme.paletteDarkBlue),
          ),
          _getSectionDetail(S.of(context).miDiarioDeEmocionesDetail),
          24.h.verticalSpace,
          Text(
            S.of(context).howCommentOfResult,
            style: DanaTheme.textBodyBold(DanaTheme.paletteDarkBlue),
          ),
          12.h.verticalSpace,
          Text(S.of(context).visionSemanal, style: DanaTheme.bannerTitle2),
          12.h.verticalSpace,
          _getSectionImage("semana_graph.png", isNormalImage: true),
          _getSectionDetail(
            S.of(context).visionSemanalDetail,
          ),

          12.h.verticalSpace,
          Text(S.of(context).visionMensual, style: DanaTheme.bannerTitle2),
          12.h.verticalSpace,
          _getSectionImage("mes_graph.png", isNormalImage: true),
          _getSectionDetail(S.of(context).visionMensualDetail),

          //
          12.h.verticalSpace,
          Text(S.of(context).visionAnual, style: DanaTheme.bannerTitle2),
          12.h.verticalSpace,
          _getSectionImage("anual_graph.png", isNormalImage: true),
          _getSectionDetail(S.of(context).visionAnualDetail),

          24.h.verticalSpace,

          Text(
            S.of(context).moodTrackerInfoPageFooterTitle,
            style: DanaTheme.textBodyBold(DanaTheme.paletteDarkBlue),
          ),
          _getSectionDetail(
            S.of(context).moodTrackerInfoPageFooterText,
          ),

          80.h.verticalSpace,
        ],
      ),
    );
  }

  Widget _getSectionTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(top: interSectionMargin),
      child: Text(
        text,
        style: DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
      ),
    );
  }

  Widget _getSectionSubTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(top: interSectionMargin),
      child: Text(
        text,
        style: DanaTheme.textCta(DanaTheme.paletteDarkBlue),
      ),
    );
  }

  Widget _getSectionDetail(String text) {
    return Padding(
        padding: EdgeInsets.only(top: intraSectionMargin),
        child: Text(
          text,
          style: DanaTheme.textBody(DanaTheme.paletteDarkBlue),
        ));
  }

  Widget _getSectionDetailBold(String text) {
    return Padding(
        padding: EdgeInsets.only(top: intraSectionMargin),
        child: Text(
          text,
          style: DanaTheme.textBodyBold(DanaTheme.paletteDarkBlue),
        ));
  }

  Widget _getSectionImage(String imageName, {bool isNormalImage = false}) {
    return Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child:
            isNormalImage ? buildImage(imageName) : buildSvgImage(imageName));
  }
}
