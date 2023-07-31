//IMPORT EXTERN APP
//IMPORT INTERN APP
import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/interested_event_enum.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/cubits/interested_event/interested_event_cubit.dart';
import 'package:app/cubits/user_premium/user_premium_cubit.dart';
import 'package:app/cubits/user_premium/user_premium_state.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/in_app_review/app/cubits/in_app_review_cubit.dart';
import 'package:app/features/permissions/app/cubits/permissions_handler_cubit.dart';
import 'package:app/features/permissions/app/cubits/permissions_handler_state.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/features/user/app/cubits/initial_profile_state.dart';
import 'package:app/features/user/domain/enums/genre.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/purchases/premium_type.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/banner.dart';
import 'package:app/utils/images.dart';
import 'package:app/utils/modal.dart';
import 'package:app/utils/preferences.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/widgets/shared/social_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    _getUserInfo();
    BannerUtils.checkVisibility('profile');
    super.initState();
    _getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitialProfileCubit, InitialProfileState>(
      bloc: locator<InitialProfileCubit>(),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: DanaTheme.paletteWhite,
          body: Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 155,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: DanaTheme.bodyPadding),
                        child: Text(
                          S.of(context).screenProfileViewTitle,
                          style: DanaTheme.textSubHeadlineBold(
                              DanaTheme.paletteDarkBlue),
                        ),
                      ),
                    ),
                    SizedBox(height: 19),
                    _profileInformationWidget(state),
                    Container(height: 26),
                    _middleSection(),
                    Container(height: 56),
                    _profileLinks(state),
                    Container(height: 56),
                    getScreenHeight(context) > 800
                        ? Container(height: 84)
                        : Container(height: 56)
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 50,
                    color: DanaTheme.bgAppbar,
                  ),
                  SocialAppBar(
                    title: 'Perfil',
                    bgColor: DanaTheme.bgAppbar,
                    showBackButton: true,
                    showLogo: false,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _profileInformationWidget(InitialProfileState initialProfileState) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: DanaTheme.bgCardColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: DanaTheme.paletteGreyShadow.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(DanaTheme.bodyPadding),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SvgPicture.asset(
                    'assets/images/ic_avatar.svg',
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.fitWidth,
                    width: 70,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 19),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 10,
                            ),
                            Text(
                              initialProfileState.name ?? '',
                              style:
                                  DanaTheme.textCta(DanaTheme.paletteDarkBlue),
                            ),
                            Text(initialProfileState.location ?? "",
                                style: DanaTheme.textSmallText(
                                    DanaTheme.paletteDarkBlue))
                          ]))
                ]),
          ),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
          Container(
              padding: EdgeInsets.only(
                  left: DanaTheme.bodyPadding, top: DanaTheme.bodyPadding),
              alignment: Alignment.centerLeft,
              child: Text(S.of(context).screenProfileViewEmail,
                  style: DanaTheme.textSuperSmallTextBoldLabel(
                    DanaTheme.paletteDarkBlue,
                  ))),
          Container(
              padding: EdgeInsets.only(
                  left: DanaTheme.bodyPadding, bottom: DanaTheme.bodyPadding),
              alignment: Alignment.centerLeft,
              child: Text(initialProfileState.email ?? '',
                  style: DanaTheme.textSmallText(
                    DanaTheme.paletteDarkBlue,
                  ))),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
          Container(
              padding: EdgeInsets.only(
                  left: DanaTheme.bodyPadding, top: DanaTheme.bodyPadding),
              alignment: Alignment.centerLeft,
              child: Text(S.of(context).screenProfileViewBirthday,
                  style: DanaTheme.textSuperSmallTextBoldLabel(
                    DanaTheme.paletteDarkBlue,
                  ))),
          Container(
              padding: EdgeInsets.only(
                  left: DanaTheme.bodyPadding, bottom: DanaTheme.bodyPadding),
              alignment: Alignment.centerLeft,
              child: Text(initialProfileState.birthday ?? '',
                  style: DanaTheme.textSmallText(
                    DanaTheme.paletteDarkBlue,
                  ))),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
          Container(
              padding: EdgeInsets.only(
                  left: DanaTheme.bodyPadding, top: DanaTheme.bodyPadding),
              alignment: Alignment.centerLeft,
              child: Text(S.of(context).screenProfileViewGenre,
                  style: DanaTheme.textSuperSmallTextBoldLabel(
                    DanaTheme.paletteDarkBlue,
                  ))),
          Container(
              padding: EdgeInsets.only(
                  left: DanaTheme.bodyPadding, bottom: DanaTheme.bodyPadding),
              alignment: Alignment.centerLeft,
              child: Text(translateGenre(context, initialProfileState.genre),
                  style: DanaTheme.textSmallText(
                    DanaTheme.paletteDarkBlue,
                  ))),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Column(children: [
                    Container(
                        padding: EdgeInsets.only(
                            left: DanaTheme.bodyPadding,
                            top: DanaTheme.bodyPadding),
                        alignment: Alignment.centerLeft,
                        child: Text(S.of(context).screenProfileViewMoment,
                            style: DanaTheme.textSuperSmallTextBoldLabel(
                              DanaTheme.paletteDarkBlue,
                            ))),
                    Container(
                        padding: EdgeInsets.only(
                            left: DanaTheme.bodyPadding,
                            bottom: DanaTheme.bodyPadding),
                        alignment: Alignment.centerLeft,
                        child: Text(
                            initialProfileMomentToStringTraduction(context,
                                initialProfileState.initialProfileMoment),
                            style: DanaTheme.textSmallText(
                              DanaTheme.paletteDarkBlue,
                            ))),
                  ])),
              initialProfileState.showPregnantWeeks == false
                  ? Container()
                  : Expanded(
                      flex: 1,
                      child: Column(children: [
                        Container(
                            padding: EdgeInsets.only(
                                left: DanaTheme.bodyPadding,
                                top: DanaTheme.bodyPadding),
                            alignment: Alignment.centerLeft,
                            child: Text(
                                S.of(context).screenProfileViewPregnantWeek,
                                style: DanaTheme.textSuperSmallTextBoldLabel(
                                  DanaTheme.paletteDarkBlue,
                                ))),
                        Container(
                            padding: EdgeInsets.only(
                                left: DanaTheme.bodyPadding,
                                bottom: DanaTheme.bodyPadding),
                            alignment: Alignment.centerLeft,
                            child: Text(
                                initialProfileState.pregnantWeeks.toString(),
                                style: DanaTheme.textSmallText(
                                  DanaTheme.paletteDarkBlue,
                                ))),
                      ])),
              initialProfileState.showMotherMonths == false
                  ? Container()
                  : Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: DanaTheme.bodyPadding,
                                top: DanaTheme.bodyPadding),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              S.of(context).screenProfileViewMotherMonths,
                              style: DanaTheme.textSuperSmallTextBoldLabel(
                                DanaTheme.paletteDarkBlue,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: DanaTheme.bodyPadding,
                                bottom: DanaTheme.bodyPadding),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              initialProfileState.initialProfileMotherMonths
                                  .toString(),
                              style: DanaTheme.textSmallText(
                                  DanaTheme.paletteDarkBlue),
                            ),
                          ),
                        ],
                      ),
                    )
            ],
          ),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
          Container(
            padding: EdgeInsets.all(DanaTheme.bodyPadding),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(162)),
            width: double.infinity,
            height: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: DanaTheme.paletteDarkBlue, // foreground
                ),
                child: Text(S.of(context).screenProfileViewButtonEditProfile,
                    style: DanaTheme.textCta(DanaTheme.paletteWhite)),
                onPressed: _openEditProfile,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _openEditProfile() {
    context.pushNamed(AppRoutes.editProfile.name);
  }

  Widget _middleSection() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: DanaTheme.bodyPadding),
            height: 1,
            color: DanaTheme.paletteLightGrey,
          ),
          _buildOptions(
            text: S.of(context).profilePageAccount,
            onTap: () {
              _navigateTextPage(ProfileLinks.ACCOUNT);
            },
            iconData: Icons.credit_card_rounded,
            trailling: _ProfilePremiumTag(),
          ),
          Container(
            margin: EdgeInsets.only(left: DanaTheme.bodyPadding),
            height: 1,
            color: DanaTheme.paletteLightGrey,
          ),
          _buildOptions(
            text: S.of(context).profilePageFavorites,
            onTap: () async {
              await locator<InterestedEventCubit>().eventOfInterestHappened(
                  EventOfInterestedType.NAVIGATE_FAVORITE_UNITS, {});
              context.pushNamed(AppRoutes.favourites.name);
            },
            iconData: Icons.bookmark_outline,
          ),
          Container(
            margin: EdgeInsets.only(left: DanaTheme.bodyPadding),
            height: 1,
            color: DanaTheme.paletteLightGrey,
          ),
          Container(
            margin: EdgeInsets.only(left: DanaTheme.bodyPadding),
            height: 1,
            color: DanaTheme.paletteLightGrey,
          ),
          _buildOptions(
            text: S.of(context).profilePageProgress,
            onTap: () {
              _navigateTextPage(ProfileLinks.MY_PROGRESS);
            },
            wid: buildImage('progress.png', 15),
          ),
          Container(
            margin: EdgeInsets.only(left: DanaTheme.bodyPadding),
            height: 1,
            color: DanaTheme.paletteLightGrey,
          ),
        ],
      ),
    );
  }

  Widget _profileLinks(InitialProfileState initialProfileState) {
    return Container(
      padding: EdgeInsets.only(left: DanaTheme.bodyPadding),
      child: Column(
        children: [
          _buildTitleOptions(S.of(context).screenProfileViewAboutApp),
          SizedBox(height: 20),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
          _buildOptions(
              text: S.of(context).screenProfileViewLinkWelcome,
              onTap: () {
                _navigateTextPage(ProfileLinks.WELCOME);
              }),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
          _buildOptions(
              text: S.current.autoPlay,
              onTap: () {},
              trailling: Switch.adaptive(
                  activeColor: DanaTheme.paletteOrange,
                  value: PreferenceUtils.getAutoPlay(),
                  onChanged: (value) {
                    setState(() {
                      DanaAnalyticsService.trackAutoplayActivated(value);
                      PreferenceUtils.setBool(AUTO_PLAY, value);
                    });
                  })),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
          _buildOptions(
              text: S.current.notifications,
              onTap: () {},
              trailling:
                  BlocBuilder<PermissionsHandlerCubit, PermissionsHandlerState>(
                bloc: locator<PermissionsHandlerCubit>(),
                builder: (context, state) {
                  return Switch.adaptive(
                      activeColor: DanaTheme.paletteOrange,
                      value: state.isNotificationsAllowed,
                      onChanged: (value) async {
                        await locator<PermissionsHandlerCubit>()
                            .changePermission(value);
                        DanaAnalyticsService.trackNotificationPermissionChanges(
                            value);
                      });
                },
              )),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
          _buildOptions(
              text: S.of(context).screenProfileViewLinkHelp,
              onTap: () {
                _navigateTextPage(ProfileLinks.HELP);
              }),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
          _buildOptions(
              text: S.of(context).screenProfileViewRate,
              onTap: () => locator<InAppReviewCubit>().goToStore()),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
          _buildOptions(
              text: S.of(context).screenProfileViewLinkCollaborators,
              onTap: () {
                _navigateTextPage(ProfileLinks.COLLABORATORS);
              }),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
          _buildOptions(
              text: S.of(context).screenProfileViewLinkPrivacity,
              onTap: () {
                context.pushNamed(AppRoutes.privacity.name,
                    extra: ProfileLinks.PRIVACITY);
              }),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
          _buildOptions(
              text: S.of(context).screenProfileViewLinkTermsConditions,
              onTap: () {
                context.pushNamed(AppRoutes.termsAndConditions.name,
                    extra: ProfileLinks.TERMS_AND_CONDITIONS);
              }),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
          _buildOptions(
              text: S.of(context).screenProfileViewLinkCookies,
              onTap: () {
                context.pushNamed(AppRoutes.cookies.name,
                    extra: ProfileLinks.COOKIES);
              }),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
          _buildOptions(
              text: S.of(context).screenProfileViewLinkShareApp,
              onTap: () async {
                DanaAnalyticsService.trackShareDana();
                await locator<InterestedEventCubit>().eventOfInterestHappened(
                    EventOfInterestedType.CLICK_SHARE_DANA, {});
                _onShare(context);
              }),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
          _buildOptions(
              text: S.of(context).screenProfileViewLinkContact,
              onTap: () {
                DanaAnalyticsService.trackContactDana();
                onContact(context);
              }),
          Container(height: 1, color: DanaTheme.paletteLightGrey),
        ],
      ),
    );
  }

  Align _buildTitleOptions(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
      ),
    );
  }

  Widget _buildOptions({
    required String text,
    required Function onTap,
    Widget? trailling,
    IconData? iconData,
    Widget? wid,
  }) {
    return TextButton(
      onPressed: onTap as void Function()?,
      child: Padding(
        padding: EdgeInsets.all(DanaTheme.bodyPadding),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Visibility(
                visible: iconData != null,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    iconData,
                    size: 20,
                    color: DanaTheme.paletteDarkBlue,
                  ),
                ),
              ),
              if (wid != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: wid,
                ),
              Text(
                text,
                style: DanaTheme.textSmallText(DanaTheme.paletteDarkBlue),
              ),
              if (trailling != null) ...[
                Spacer(),
                trailling,
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _onShare(BuildContext context) async {
    Share.share(
      S.of(context).pageProfileShareMessage,
      subject: S.of(context).pageProfileShareSubject,
    );
  }

  void _navigateTextPage(ProfileLinks link) {
    context.pushNamed(AppRoutes.linkContent.name,
        queryParams: {"name": link.name}, extra: link);
  }

  void _getUserInfo() {
    locator<InitialProfileCubit>().getUserByEmail();
  }
}

Future<void> onContact(BuildContext context) async {
  String uri = 'mailto:hola@dana.health';
  if (await canLaunchUrlString(uri)) {
    await launchUrlString(uri);
  } else {
    ModalUtils().showModal(
      context,
      title: S.of(context).noMailWay,
      onEditTap: () async {
        Navigator.pop(context);
      },
      onPostTap: () async {},
    );
  }
}

class _ProfilePremiumTag extends StatelessWidget {
  const _ProfilePremiumTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserPremiumCubit, UserPremiumState, PremiumType>(
      bloc: locator<UserPremiumCubit>(),
      selector: (state) => state.premiumType,
      builder: (context, state) {
        if (state == PremiumType.none) {
          return SizedBox();
        }
        return Container(
          padding:
              EdgeInsets.symmetric(horizontal: Sizes.p12, vertical: Sizes.p4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: DanaTheme.paletteLightBlue,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'PREMIUM',
                style: DanaTheme.textWheelNumber(DanaTheme.paletteDarkBlue),
              ),
              gapW8,
              SvgPicture.asset(
                '$ASSETS_IMAGES/profile_appbar_icon.svg',
                fit: BoxFit.contain,
              ),
            ],
          ),
        );
      },
    );
  }
}
