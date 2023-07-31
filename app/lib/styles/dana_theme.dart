import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: avoid_classes_with_only_static_members
class DanaTheme {
  // Colors
  static const Color primaryColor = Color(0xFF5C4789);
  static const Color secondaryColor = Color(0xFFEE8B60);
  static const Color tertiaryColor = Color(0xFFFFFFFF);
  static const Color bgColor = Color(0xFFFDF4EE);
  static const Color bgSuccessColor = Color(0xFF39246F);
  static const Color bgCardColor = Color(0xFFFFFFFF);
  static const Color bgAppbar = Color.fromRGBO(248, 207, 198, 1);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color grayColor = Color(0xFFF1F1F1);
  static const Color bgPremium = Color(0xFF39246F);
  static const Color progressBgColor = Color(0xFFEBF5F1);
  static const Color progressValueColor = Color(0xFF59A989);
  static const Color lightGrayColor = Color(0xFFF0ECE4);
  static const Color bgPollColor = Color(0xFFF9F7F4);

  // Palette
  static const Color paletteWhite = Color(0xFFFFFFFF);
  static const Color paletteOrange = Color(0xFFE54925);
  static const Color paletteFOrange = Color(0xFFFFA191);
  static const Color paletteDarkBlue = Color(0xFF32264C);
  static const Color paletteDanaPink = Color(0xFFFFA191);
  static const Color paletteGreen = Color(0xFF528A4F);
  static const Color paletteLightBlue = Color(0xFF6EB3F2);
  static const Color paletteGrey = Color(0xFFD4D4D4);
  static const Color paletteGreyMedium = Color.fromRGBO(50, 38, 76, 0.6);

  static const Color paletteLightGrey = Color(0xFFF0ECE4);
  static const Color paletteFBrown = Color(0xFFE9CCBC);
  static const Color paletteFPink = Color(0xFFF8CFC6);

  static const Color paletteGreyTonesDarkGrey = Color(0xCC32264C);
  static const Color paletteGreyTonesMediumGrey = Color(0x9932264C);
  static const Color paletteGreyTonesLightGrey20 = Color(0x3332264C);
  static const Color paletteGreyTonesLightGrey60 = Color(0x9932264C);
  static const Color paletteGreyTonesLightGrey80 = Color(0xCC32264C);

  static const Color paletteGreyShadow = Color(0xFF32264C);

  static const Color paletteYellow = Color(0xFFF1D669);
  static const Color palleteRed = Color(0xFFEA5A3D);

  static const Color palleteGreyIcon = Color(0xFF847D94);
  static const Color palleteGreyComment = Color(0xFFEDEDEC);
  static const Color palleteGreyDate = Color(0xFF827186);
  static const Color palleteGrayBorder = Color(0xFFD6D4DB);
  static const Color palleteDarkGray = Color(0xFF50555C);

  // Cards
  static const double cardElevation = 1.0;
  static const double cardBorderRadius = 15;

  // Paddings
  static const double bodyPadding = 20.0;
  static const double loginPadding = 20.0;
  static const double paddingSignInButtons = 50.0;
  static const double emoticonPadding = 7.0;
  static const double smallPadding = 8.0;
  static const double mediumPadding = 12.0;
  static const double bigPadding = 24.0;

  // Inputs
  static const double formFieldPadding = 10.0;
  static const double formFieldBorderWidth = 1.0;
  static const double formFieldBorderRadius = 8;
  static const Color formFieldBorderColor = Color(0xFFCECECE);
  static const Color formFieldFocusedBorderColor = Color(0xFFA8A8A8);
  static const double formMarginBetween = 7.0;
  static const double formMarginBetweenBig = 12.0;
  static const double formMarginTop = 22.0;

  String primaryFontFamily = 'Nunito';
  String secondaryFontFamily = 'Roboto';

  static TextStyle get titleAppbar => GoogleFonts.getFont(
        'Nunito',
        color: DanaTheme.paletteDarkBlue,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get premiumTitle => GoogleFonts.getFont(
        'Nunito',
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w600,
        fontSize: 40,
      );

  static TextStyle get premiumFeatures => GoogleFonts.getFont(
        'Nunito',
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w600,
        fontSize: 15,
      );

  static TextStyle get title1 => GoogleFonts.getFont(
        'Nunito',
        color: Color(0xFF303030),
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );
  static TextStyle get title2 => GoogleFonts.getFont(
        'Nunito',
        color: Color(0xFF303030),
        fontWeight: FontWeight.w500,
        fontSize: 22,
      );
  static TextStyle get title3 => GoogleFonts.getFont(
        'Nunito',
        color: Color(0xFF303030),
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  static TextStyle get title4 => GoogleFonts.getFont(
        'Nunito',
        color: Color(0xFF32264C),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      );
  static TextStyle get subtitle1 => GoogleFonts.getFont(
        'Nunito',
        color: Color(0xFF757575),
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  static TextStyle get subtitle2 => GoogleFonts.getFont(
        'Nunito',
        color: Color(0xFF616161),
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  static TextStyle get subtitle3 => GoogleFonts.getFont(
        'Nunito',
        color: Color(0xFF32264C),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
  static TextStyle get bodyText1 => GoogleFonts.getFont(
        'Nunito',
        color: Color(0xFF303030),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  static TextStyle get bodyText1WithFlex => GoogleFonts.getFont(
        'Nunito',
        color: Color(0xFF303030),
        fontWeight: FontWeight.normal,
        fontSize: 13.sp,
      );
  static TextStyle get bodyText2 => GoogleFonts.getFont(
        'Poppins',
        color: Color(0xFF424242),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );

  static TextStyle get bodyText3 => GoogleFonts.getFont(
        'Poppins',
        color: DanaTheme.paletteDarkBlue,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  static TextStyle get progressUnitText1 => GoogleFonts.getFont(
        'Nunito',
        color: progressValueColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
  static TextStyle get progressUnitText2 => GoogleFonts.getFont(
        'Nunito',
        color: progressValueColor,
        fontWeight: FontWeight.w700,
        fontSize: 14,
      );
  static TextStyle get successText => GoogleFonts.getFont(
        'Nunito',
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w500,
        fontSize: 22,
      );

  // New styles
  static TextStyle textMarketingHeadline(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: 26,
      );

  static TextStyle textHeadline(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: 32,
      );

  static TextStyle textHeadlineSmall(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: 28,
      );

  static TextStyle textHeadlineSmallLight(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w400,
        fontSize: 28,
      );

  static TextStyle textSubHeadline(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w400,
        fontSize: 20,
      );

  static TextStyle textSubHeadlineBold(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      );

  static TextStyle textCta(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        height: 1,
      );

  static TextStyle textBody(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      );
  static TextStyle linkText() => GoogleFonts.getFont(
        'Nunito',
        color: Colors.blue,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      );

  static TextStyle textBodyItalicsBold(Color c) => GoogleFonts.getFont('Nunito',
      color: c,
      fontWeight: FontWeight.w700,
      fontSize: 18,
      fontStyle: FontStyle.italic);

  static TextStyle textBodyBold(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      );

  static TextStyle textTitle(Color c, {bool underline = false}) =>
      GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        decoration: underline ? TextDecoration.underline : TextDecoration.none,
      );

  static TextStyle textSmallTextBold(Color c, {bool underline = false}) =>
      GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        decoration: underline ? TextDecoration.underline : TextDecoration.none,
      );

  static TextStyle textSmallText(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      );

  static TextStyle textSuperSmallTextBold(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: 13,
      );

  static TextStyle textSuperSmallTextBoldEmotions(Color c) =>
      GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: 12,
      );

  static TextStyle textSuperSmallerTextBoldEmotions(Color c,
          {bool underline = false}) =>
      GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: 11,
        decoration: underline ? TextDecoration.underline : TextDecoration.none,
      );

  static TextStyle textSuperSmallText(Color c, {bool underline = false}) =>
      GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
        height: 1.2,
        decoration: underline ? TextDecoration.underline : TextDecoration.none,
      );

  static TextStyle textSuperSmallTextPremium(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      );

  static TextStyle textSuperSmallTextBoldLabel(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: 10,
      );

  static TextStyle textWheelNumber(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      );

  static TextStyle textProgramProgress(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: 12,
      );
  static TextStyle textProgramProgressFlex(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: 11.sp,
      );

  static TextStyle get bannerTitle1 => GoogleFonts.getFont(
        'Nunito',
        color: DanaTheme.paletteDarkBlue,
        fontWeight: FontWeight.w700,
        fontSize: 28,
      );

  static TextStyle get bannerTitle2 => GoogleFonts.getFont(
        'Nunito',
        color: DanaTheme.paletteDarkBlue,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );

  static TextStyle textCommentUserName(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      );

  static TextStyle textCommentDate(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w400,
        fontSize: 15.sp,
      );

  static TextStyle textCommentUserSpecialistRole(Color c) =>
      GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );

  static TextStyle textCommentText(Color c) => GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w400,
        fontSize: 15.sp,
      );
  static TextStyle get textShowMore => GoogleFonts.getFont(
        'Nunito',
        color: Color(0xFFE54925),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );

  static TextStyle get textShowPrograms => GoogleFonts.getFont(
        'Nunito',
        color: paletteWhite,
        fontWeight: FontWeight.bold,
        fontSize: 8.sp,
      );

  static TextStyle get textShowPrograms2 => GoogleFonts.getFont(
        'Nunito',
        color: paletteWhite,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
  static TextStyle get textPercent => GoogleFonts.getFont(
        'Nunito',
        color: paletteWhite,
        fontWeight: FontWeight.bold,
        fontSize: 10,
      );

  ThemeData getInitialTheme() {
    return ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark
              .copyWith(statusBarColor: Colors.transparent),
        ),
        primaryColor: DanaTheme.paletteDarkBlue,
        secondaryHeaderColor: DanaTheme.paletteDarkBlue,
        splashColor: DanaTheme.paletteDarkBlue,
        canvasColor: Colors.transparent,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: DanaTheme.paletteDarkBlue));
  }
}

extension TextStyleHelper on TextStyle {
  TextStyle override(
          {required String fontFamily,
          Color? color,
          double? fontSize,
          FontWeight? fontWeight,
          FontStyle? fontStyle}) =>
      GoogleFonts.getFont(
        fontFamily,
        color: color ?? this.color,
        fontSize: fontSize ?? this.fontSize,
        fontWeight: fontWeight ?? this.fontWeight,
        fontStyle: fontStyle ?? this.fontStyle,
      );
}
