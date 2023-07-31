import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/edit_profile/app/cubits/edit_profile_cubit.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class MomentsDialog extends StatelessWidget {
  const MomentsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(DanaTheme.bodyPadding),
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: InitialProfileMoment.values
                .map(
                  (profileMoment) => Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        locator<EditProfileCubit>()
                            .updateProfileMoment(profileMoment);
                        Navigator.pop(context);
                      },
                      child: Text(
                        initialProfileMomentToStringTraduction(
                          context,
                          profileMoment,
                        ),
                        style: DanaTheme.textBody(
                          DanaTheme.paletteDarkBlue,
                        ),
                      ),
                    ),
                  ),
                )
                .toList()),
      ),
    );
  }
}
