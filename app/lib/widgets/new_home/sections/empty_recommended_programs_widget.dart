//IMPORT EXTERN APP
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

//IMPORT INTERN APP
import 'package:app/cubits/change_page/change_page_cubit.dart';
import 'package:app/cubits/recommended_programs/recommended_programs_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/styles/dana_theme.dart';

class EmptyRecommendedProgramsWidget extends StatelessWidget {
  final RecommendedProgramsState stateRecommended;
  const EmptyRecommendedProgramsWidget({
    Key? key,
    required this.stateRecommended,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (stateRecommended.statusRecommendedPrograms ==
            StatusRecommendedPrograms.USER_NOT_STARTED_PROGRAMS)
          Text(
            S.of(context).pageNewHomeNotStarted,
            style: DanaTheme.bodyText3,
            textAlign: TextAlign.left,
          ),
        if (stateRecommended.statusRecommendedPrograms ==
            StatusRecommendedPrograms.USER_STARTED_PROGRAMS)
          Text(
            S.of(context).pageNewHomeStarted,
            style: DanaTheme.bodyText3,
            textAlign: TextAlign.left,
          ),
        if (stateRecommended.statusRecommendedPrograms ==
            StatusRecommendedPrograms.USER_END_PROGRAMS)
          Text(
            S.of(context).pageNewHomeEnd,
            style: DanaTheme.bodyText3,
            textAlign: TextAlign.left,
          ),
        SizedBox(
          height: 16,
        ),
        if (stateRecommended.statusRecommendedPrograms ==
                StatusRecommendedPrograms.USER_NOT_STARTED_PROGRAMS ||
            stateRecommended.statusRecommendedPrograms ==
                StatusRecommendedPrograms.USER_STARTED_PROGRAMS)
          GestureDetector(
            onTap: () {
              DanaAnalyticsService.trackHomeOngoingProgramsViewMoreClick(0);
              context.read<ChangePageCubit>().changeIndexPage(index: 1);
            },
            child: Container(
              height: 50,
              width: 180,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: DanaTheme.paletteDarkBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Center(
                child: Text(
                  S.of(context).pageNewHomeGoToPage,
                  style: DanaTheme.textShowPrograms2,
                ),
              ),
            ),
          ),
        if (stateRecommended.statusRecommendedPrograms ==
            StatusRecommendedPrograms.USER_END_PROGRAMS)
          GestureDetector(
            onTap: () async {
              String uri = 'mailto:hola@dana.health';
              if (await canLaunchUrlString(uri)) {
                await launchUrlString(uri);
              } else {
                print("No email client found");
              }
            },
            child: Container(
              height: 50,
              width: 180,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: DanaTheme.paletteDarkBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Center(
                child: Text(
                  S.of(context).contactWithUs,
                  style: DanaTheme.textShowPrograms2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
