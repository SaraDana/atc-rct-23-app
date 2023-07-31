//IMPORT EXTERN APP
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:transparent_image/transparent_image.dart';

//IMPORT LOCAL APP
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/cubits/program/program_state.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/cubits/program/program_cubit.dart';
import 'package:app/models/program_model.dart';
import 'package:app/screens/content/program_detail_page.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/spacers.utils.dart';

class ProgramRecommendedWidget extends StatelessWidget {
  final String? tagFilter;
  final String programPath;
  final String programId;

  const ProgramRecommendedWidget(
      {Key? key,
      this.tagFilter,
      required this.programPath,
      required this.programId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DanaAnalyticsService.trackHomeShowRecommendedProgram(programId);
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProgramCubit>(
          create: (context) => ProgramCubit()..getProgram(programId),
        ),
      ],
      child: BlocBuilder<ProgramCubit, ProgramState>(
        builder: (context, stateProgram) {
          if (stateProgram.status == StatusCubit.INITIAL) {
            context.read<ProgramCubit>().getProgram(programId);
          }
          if (stateProgram.status == StatusCubit.SUCCESS) {
            return GestureDetector(
              onTap: () => _navToProgramDetail(
                onBackPressed: () {
                  context.read<ProgramCubit>().chargeProgram();
                },
                context: context,
                program: stateProgram.program!,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _showPicture(program: stateProgram.program!),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  stateProgram.program!.title!,
                                  overflow: TextOverflow.ellipsis,
                                  style: DanaTheme.textCta(
                                      DanaTheme.paletteDarkBlue),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: getSpaceTitleSubtitleCard(),
                                ),
                                Text(
                                  stateProgram.program!.subtitle!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: DanaTheme.textSuperSmallText(
                                      DanaTheme.paletteGreyTonesLightGrey60),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            Text(
                              "ver programa",
                              style: DanaTheme.textShowMore,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _showPicture({required Program program}) {
    return program.poster == null
        ? SizedBox(
            height: 100,
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: DanaTheme.paletteDanaPink,
                color: DanaTheme.paletteFPink,
              ),
            ),
          )
        : SizedBox(
            height: 110,
            width: 132,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Hero(
                tag: program.id!,
                child: FadeInImage.memoryNetwork(
                  fadeInCurve: Curves.easeInCirc,
                  fadeInDuration: Duration(milliseconds: 50),
                  image: program.poster!,
                  fit: BoxFit.fitWidth,
                  placeholder: kTransparentImage,
                ),
              ),
            ),
          );
  }

  void _navToProgramDetail({
    required BuildContext context,
    required Program program,
    required Function() onBackPressed,
  }) {
    DanaAnalyticsService.trackHomeOpenRecommendedProgramClick(programId);
    context.goNamed(AppRoutes.programDetailPage.name,
        queryParams: {
          "programId" : program.id,
        },
        extra: ProgramDetailArguments(
          program: program,
          onBackPressed: onBackPressed,
        ));
  }
}
