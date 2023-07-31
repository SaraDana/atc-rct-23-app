import 'package:app/core/di/locator.dart';
import 'package:app/features/edit_profile/app/cubits/edit_profile_cubit.dart';
import 'package:app/features/user/domain/enums/genre.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class SelectGenreDialog extends StatelessWidget {
  const SelectGenreDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(DanaTheme.bodyPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: profilesGenre.map((genre) {
            return Wrap(
              children: [
                GestureDetector(
                  onTap: () {
                    locator<EditProfileCubit>().updateGenre(genre.name);
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      translateGenre(context, genre),
                      style: DanaTheme.textBody(DanaTheme.paletteDarkBlue),
                    ),
                  ),
                ),
                Container(height: 1, color: DanaTheme.paletteLightGrey),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
