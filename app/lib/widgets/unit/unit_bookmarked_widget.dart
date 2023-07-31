import 'dart:async';

import 'package:app/cubits/program/program_cubit.dart';
import 'package:app/cubits/program/program_state.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../core/routing/app_router.dart';
import '../../models/program_model.dart';
import '../../models/unit_bookmarked.dart';
import '../../screens/content/unit_detail_page.dart';
import '../../styles/dana_theme.dart';

class UnitBookmarkedWidget extends StatefulWidget {
  final UnitWithImage? unitWithImage;

  const UnitBookmarkedWidget({
    Key? key,
    this.unitWithImage,
  }) : super(key: key);

  @override
  _UnitBookmarkedWidgetState createState() => _UnitBookmarkedWidgetState();
}

class _UnitBookmarkedWidgetState extends State<UnitBookmarkedWidget> {
  FirebaseStorage storage = FirebaseStorage.instance;

  StreamController<bool>? _showController;

  @override
  void initState() {
    super.initState();
    _showController = StreamController<bool>.broadcast();
  }

  @override
  void dispose() {
    _showController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.unitWithImage != null) {
      return _createCardContent(
        widget.unitWithImage!,
      );
    }
    return Text("Culpable");
  }

  Widget _createCardContent(UnitWithImage unitWithImage) {
    return Container(
      width: 264,
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      decoration: BoxDecoration(
        color: DanaTheme.bgCardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
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
      child: BlocProvider<ProgramCubit>(
        create: (context) => ProgramCubit()
          ..getProgram(widget.unitWithImage?.unit.programId ?? ''),
        child: BlocBuilder<ProgramCubit, ProgramState>(
          builder: (context, programState) {
            return GestureDetector(
              onTap: () => _navToUnitDetail(
                  unitWithImage: unitWithImage,
                  program: programState.program,
                  onFinishedProgramPressed: () async {
                    if (programState.program != null)
                      await context
                          .read<ProgramCubit>()
                          .finishProgram(programState.program!.id!);
                  },
                  onBackPressed: () {}),
              child: Stack(
                children: [
                  Column(
                    children: [
                      _showPicture(widget.unitWithImage!),
                      Container(height: 16),
                      Padding(
                        padding: EdgeInsets.only(
                          left: DanaTheme.smallPadding,
                          right: DanaTheme.smallPadding,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 36,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  unitWithImage.unit.title!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: DanaTheme.bodyText1.copyWith(
                                      color: DanaTheme.paletteDarkBlue),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(height: 12),
                            // _getProgressBar(),
                            Container(height: 12)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.bookmark,
                          size: 18,
                          color: DanaTheme.paletteDarkBlue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _showPicture(UnitWithImage unitWithImage) {
    if (unitWithImage.image == null) {
      return SizedBox(
        height: 180,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: DanaTheme.paletteDanaPink,
            color: DanaTheme.paletteFPink,
          ),
        ),
      );
    }

    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Hero(
          tag: unitWithImage.unit.id!,
          child: FadeInImage.memoryNetwork(
            fadeInCurve: Curves.easeInCirc,
            fadeInDuration: Duration(milliseconds: 50),
            image: unitWithImage.image!,
            fit: BoxFit.fitWidth,
            placeholder: kTransparentImage,
          ),
        ),
      ),
    );
  }

  void _navToUnitDetail({
    required UnitWithImage unitWithImage,
    required Program? program,
    required VoidCallback? onBackPressed,
    required VoidCallback? onFinishedProgramPressed,
  }) {
    // locator<UserPremiumCubit>().navigateTo(() => context.pushNamed(AppRoutes.unitDetail.name,
    //     extra: UnitDetailPageObject(null, null, unitWithImage)), program);
    //TODO
    context.pushNamed(AppRoutes.unitDetail.name,
        extra: UnitDetailPageObject(
          onBackPressed: onBackPressed,
          program: program,
          unitRef: null,
          unitWithImage: unitWithImage,
          isUnitBookmarkedPage: true,
          onFinishedProgramPressed: onFinishedProgramPressed,
        ));
  }
}
