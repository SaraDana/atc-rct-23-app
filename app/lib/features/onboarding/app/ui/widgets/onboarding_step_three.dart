import 'package:app/core/di/locator.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/onboarding/app/cubits/onboarding_step_three/onboarding_step_three_cubit.dart';
import 'package:app/features/user/domain/enums/genre.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/utils/account.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingStepThree extends StatefulWidget {
  const OnboardingStepThree({Key? key}) : super(key: key);

  @override
  State<OnboardingStepThree> createState() => _OnboardingStepThreeState();
}

class _OnboardingStepThreeState extends State<OnboardingStepThree> {
  @override
  void initState() {
    DanaAnalyticsService.trackVisitPage('initial_profile_page_onboarding',
        additionalParams: {"page": "gender"});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingStepThreeCubit, OnboardingStepThreeState>(
      bloc: locator<OnboardingStepThreeCubit>()..init(),
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            AccountUtils().getOptionsProfile(
              context,
              genre: Genre.WOMAN,
              genreSelected: stringToGenre(state.genre.value),
              onTap: () => _setGenre(Genre.WOMAN),
              text: S.of(context).screenInitialProfilePage3Genre3Woman,
            ),
            Container(height: 10),
            AccountUtils().getOptionsProfile(
              context,
              genre: Genre.MAN,
              genreSelected: stringToGenre(state.genre.value),
              onTap: () => _setGenre(Genre.MAN),
              text: S.of(context).screenInitialProfilePage3Genre3Man,
            ),
            Container(height: 10),
            AccountUtils().getOptionsProfile(
              context,
              genre: Genre.NO_BINARY,
              genreSelected: stringToGenre(state.genre.value),
              onTap: () => _setGenre(Genre.NO_BINARY),
              text: S.of(context).screenInitialProfilePage3Genre3NoBinary,
            ),
            Container(height: 10),
            AccountUtils().getOptionsProfile(
              context,
              genre: Genre.NO_ANSWER,
              genreSelected: stringToGenre(state.genre.value),
              onTap: () => _setGenre(Genre.NO_ANSWER),
              text: S.of(context).screenInitialProfilePage3Genre3NoAnswer,
            ),
          ],
        );
      },
    );
  }
}

_setGenre(Genre genre) {
  locator<OnboardingStepThreeCubit>().updateGenre(genre.name);
}
