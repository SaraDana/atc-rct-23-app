import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../features/user/app/cubits/initial_profile_cubit.dart';
import '../../data/repositories/banner/firebase_banner_repository.dart';
import '../../data/services/dana_analytics_service.dart';
import '../../core/di/locator.dart';
import '../../generated/l10n.dart';
import '../../models/banner_model.dart';
import '../../styles/dana_theme.dart';
import '../../utils/banner.dart';
import '../../utils/preferences.dart';

class BannerWidget extends StatefulWidget {
  final CustomBanner? banner;

  const BannerWidget({Key? key, required this.banner}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final _formKey = GlobalKey<FormState>();
  int order = 1;
  late CustomBannerScreen bannerScreen;
  TextEditingController? inputController;

  @override
  void initState() {
    super.initState();

    inputController = TextEditingController();
    bannerScreen = widget.banner!.get(order);
  }

  @override
  void dispose() {
    inputController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: GestureDetector(
              child: Container(
                color: Colors.transparent,
              ),
              onTap: () => BannerUtils.dismiss(),
            ),
          ),
          Flexible(
            flex: 1,
            child: _buildBanner(context, widget.banner?.id ?? ''),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner(BuildContext context, String id) {
    return Form(
      key: _formKey,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          color: Colors.white,
        ),
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 35),
                  _buildTitle(context),
                  SizedBox(height: 35),
                  _buildDescription1(context),
                  SizedBox(height: 15),
                  _buildDescription2(context),
                  SizedBox(height: 15),
                  _buildInput(context),
                  SizedBox(height: 15),
                  _buildButton(context, id),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      bannerScreen.title!,
      style: DanaTheme.bannerTitle1,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDescription1(BuildContext context) {
    return Text(
      bannerScreen.description1!,
      style: DanaTheme.bannerTitle2,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDescription2(BuildContext context) {
    return bannerScreen.description2?.isEmpty ?? true
        ? _buildEmpty()
        : Text(
            bannerScreen.description2!,
            style: DanaTheme.bannerTitle2,
            textAlign: TextAlign.center,
          );
  }

  Widget _buildInput(BuildContext context) {
    return bannerScreen.input?.isEmpty ?? true
        ? _buildEmpty()
        : TextFormField(
            controller: inputController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).widgetBannerPhoneError;
              }

              final phoneValidator = RegExp(r'^[0-9]{9,}$');
              if (!phoneValidator.hasMatch(value)) {
                return S.of(context).widgetBannerPhoneError;
              }
              return null;
            },
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              hintText:
                  bannerScreen.inputHint!.isEmpty ? '' : bannerScreen.inputHint,
              hintStyle: DanaTheme.textSmallText(
                  DanaTheme.paletteGreyTonesLightGrey20),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: DanaTheme.paletteGrey,
                  width: 1,
                ),
                borderRadius:
                    BorderRadius.circular(DanaTheme.formFieldBorderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: DanaTheme.paletteOrange,
                  width: 1,
                ),
                borderRadius:
                    BorderRadius.circular(DanaTheme.formFieldBorderRadius),
              ),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: DanaTheme.paletteOrange,
                    width: 1,
                  ),
                  borderRadius:
                      BorderRadius.circular(DanaTheme.formFieldBorderRadius)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: DanaTheme.paletteOrange,
                    width: 1,
                  ),
                  borderRadius:
                      BorderRadius.circular(DanaTheme.formFieldBorderRadius)),
              filled: true,
              fillColor: DanaTheme.tertiaryColor,
              contentPadding: EdgeInsets.fromLTRB(16, 24, 0, 24),
            ),
            keyboardType: _getKeyboardType(),
            obscureText: false,
            style:
                DanaTheme.textSmallText(DanaTheme.paletteGreyTonesLightGrey60),
          );
  }

  TextInputType _getKeyboardType() {
    switch (bannerScreen.input) {
      case 'number':
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }

  Widget _buildButton(BuildContext context, String id) {
    return bannerScreen.button?.isEmpty ?? true
        ? _buildEmpty()
        : Container(
            padding: EdgeInsets.all(DanaTheme.bodyPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(162),
            ),
            width: double.infinity,
            height: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: ElevatedButton(
                onPressed: () async {
                  // check if we need to save the answer
                  if (order == 2) {
                    if (_formKey.currentState!.validate()) {
                      debugPrint(
                          'saving phone ${inputController!.text} in user ${locator<InitialProfileCubit>().state.email}');
                      DanaAnalyticsService.trackSentPhoneFromBanner(
                          widget.banner!.name);
                      await FirebaseBannerRepository()
                          .updatePhone(inputController!.text);
                      PreferenceUtils.setBool(id + PREF_ANSWERED, true);
                    } else {
                      return;
                    }
                  }

                  // show next screen
                  order++;
                  setState(() {
                    bannerScreen = widget.banner!.get(order);
                  });
                },
                child: Text(bannerScreen.button!),
              ),
            ),
          );
  }

  Widget _buildEmpty() {
    return Container();
  }
}
