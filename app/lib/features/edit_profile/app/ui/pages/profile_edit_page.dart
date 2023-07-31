//IMPORT EXTERN APP
import 'package:app/core/di/locator.dart';
import 'package:app/features/edit_profile/app/cubits/edit_profile_cubit.dart';
import 'package:app/features/edit_profile/app/cubits/edit_profile_state.dart';
import 'package:app/features/edit_profile/app/ui/widgets/edit_profile_form.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/widgets/account/image_profile_header_widget.dart';
import 'package:app/widgets/appbar/appbar_profile_account_widget.dart';

class ProfileEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      bloc: locator<EditProfileCubit>()..init(),
      builder: (context, state) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: getScreenHeight(context),
            color: DanaTheme.paletteWhite,
            child: SingleChildScrollView(
              child: state.status == StatusCubit.LOADING
                  ? CircularProgressIndicator()
                  : Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppBarProfileAccountWidget(),
                        ImageProfileHeader(),
                        Container(
                          padding: EdgeInsets.all(DanaTheme.bodyPadding),
                          child: EditProfileForm(),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
