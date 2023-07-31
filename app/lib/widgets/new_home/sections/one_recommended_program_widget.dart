//IMPORT EXTERN APP
import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//IMPORT INTERN APP
import 'package:app/cubits/change_page/change_page_cubit.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/styles/dana_theme.dart';

class OneRecommendedProgramWidget extends StatelessWidget {
  const OneRecommendedProgramWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/bg_img_programs.png',
              ),
              fit: BoxFit.cover,
            ),
            color: DanaTheme.whiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).discoverPrograms,
                textAlign: TextAlign.center,
                style: DanaTheme.subtitle3,
              ),
              SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  DanaAnalyticsService.trackHomeOngoingProgramsViewMoreClick(1);
                  context.read<ChangePageCubit>().changeIndexPage(index: 1);
                },
                child: Container(
                  height: 28,
                  decoration: BoxDecoration(
                    color: DanaTheme.paletteDarkBlue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      S.of(context).showPrograms,
                      style: DanaTheme.textShowPrograms,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
