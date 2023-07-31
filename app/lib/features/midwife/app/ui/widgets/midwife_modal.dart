import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/core/extensions/snackbar_extensions.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/widgets/buttons/cta_button.dart';
import 'package:app/core/ui/widgets/layouts/dialog_layout.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/midwife/app/cubit/midwife_cubit.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../styles/dana_theme.dart';

class MidWidwifeModal extends StatelessWidget {
  String option;
  MidWidwifeModal({required this.option, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MidWifeCubit, MidWifeState>(
        bloc: locator<MidWifeCubit>(),
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status.isChargeError) {
            context.showErrorSnackBar(message: "Hay un problema");
          }
        },
        builder: (context, state) {
          if (state.status != StatusCubit.SUCCESS) {
            return Container(
              height: .9.sh,
              child: DialogLayout(
                title: state.status == StatusCubit.LOADING
                    ? ""
                    : S.of(context).midwifePageModalTitle(
                        locator<InitialProfileCubit>().state.name.toString()),
                bodyText: "",
                bodyWidget: state.status == StatusCubit.LOADING
                    ? Container(
                        height: .35.sh,
                        child: Center(
                          child: SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: CircularProgressIndicator(
                              color: DanaTheme.paletteFOrange,
                            ),
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          16.h.verticalSpace,
                          Container(
                            width: 1.sw,
                            child: Center(
                              child: Text(
                                S.of(context).midwifePageModalMidWifeDesc,
                                textAlign: TextAlign.center,
                                style: DanaTheme.bodyText3.copyWith(
                                    fontSize: 16.sp, fontFamily: "Comfortaa"),
                              ),
                            ),
                          ),
                          16.h.verticalSpace,
                          Container(
                            width: 100.w,
                            height: 100.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage("$ASSETS_IMAGES/midwife.png"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          16.h.verticalSpace,
                          Container(
                            width: 1.sw,
                            child: Center(
                              child: Text(
                                S.of(context).midwifePageModalText,
                                textAlign: TextAlign.center,
                                style: DanaTheme.bodyText3.copyWith(
                                    fontSize: 16.sp, fontFamily: "Comfortaa"),
                              ),
                            ),
                          ),
                          12.h.verticalSpace,
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.w),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: (val) {
                                locator<MidWifeCubit>().setNumber(val);
                              },
                              decoration: InputDecoration(
                                hintText: S
                                    .of(context)
                                    .midwifePageModalTextFieldHintText,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              maxLines: 3,
                            ),
                          )
                        ],
                      ),
                buttonsSection: state.status == StatusCubit.LOADING
                    ? SizedBox()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: .6.sw,
                            child: CtaButton(
                              onPressed: () {
                                if (state.phoneNumber != null) {
                                  DanaAnalyticsService
                                      .selectedMidWifeLeavePhone();
                                  locator<MidWifeCubit>().savePhoneNumber(option);
                                }
                              },
                              text: S.of(context).midwifePageModalButtonText,
                              color: state.phoneNumber == null
                                  ? DanaTheme.paletteGrey
                                  : DanaTheme.paletteDarkBlue,
                              textColor: DanaTheme.whiteColor,
                            ),
                          ),
                          12.h.verticalSpace,
                        ],
                      ),
              ),
            );
          }
          if (state.status == StatusCubit.SUCCESS) {
            return Container(
              width: .75.sh,
              child: DialogLayout(
                title: S.of(context).midwifePageSuccessModalTitle,
                bodyText: "",
                bodyWidget: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 80.h),
                      width: 1.sw,
                      child: Center(
                        child: Text(
                          S.of(context).midwifePageSuccessModalSubTitle,
                          textAlign: TextAlign.center,
                          style: DanaTheme.bodyText3.copyWith(
                              fontSize: 16.sp, fontFamily: "Comfortaa"),
                        ),
                      ),
                    ),
                  ],
                ),
                buttonsSection: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: .6.sw,
                      child: CtaButton(
                        onPressed: () {
                          DanaAnalyticsService.selectedMidWifeConfirmation();
                          locator<MidWifeCubit>().resetState();
                          context.goNamed(AppRoutes.home.name);
                        },
                        text: S.of(context).midwifePageSuccessModalButton,
                        color: DanaTheme.paletteDarkBlue,
                        textColor: DanaTheme.whiteColor,
                      ),
                    ),
                    12.h.verticalSpace,
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
