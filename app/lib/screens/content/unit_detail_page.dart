//IMPORT EXTERN APP
import 'dart:async';

import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/status_cubit.dart';
//IMPORT LOCAL APP
import 'package:app/core/routing/app_router.dart';
import 'package:app/cubits/unit_program/unit_program_cubit.dart';
import 'package:app/cubits/unit_program/unit_program_state.dart';
import 'package:app/data/repositories/publication/firebase_publication_repository.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/models/program_model.dart';
import 'package:app/models/unit_bookmarked.dart';
import 'package:app/models/unit_model.dart';
import 'package:app/screens/content/program_detail_page.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/banner.dart';
import 'package:app/utils/bookmarks.dart';
import 'package:app/utils/preferences.dart';
import 'package:app/utils/programs.utils.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/widgets/audio_player/common.dart';
import 'package:app/widgets/audio_player/control_buttons.dart';
import 'package:app/widgets/content/header_unit_detail_widget.dart';
import 'package:app/widgets/content/uniti_text_content_widget.dart';
import 'package:app/widgets/shared/progress_app_bar.dart';
import 'package:app/widgets/unit/unit_footer_widget.dart';
import 'package:audio_session/audio_session.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class UnitDetailPageObject {
  final DocumentReference? unitRef;
  final Program? program;
  final UnitWithImage? unitWithImage;
  final VoidCallback? onBackPressed;
  final VoidCallback? onFinishedProgramPressed;
  final bool? isUnitBookmarkedPage;
  final bool fromAutoPlay;

  const UnitDetailPageObject({
    required this.unitRef,
    required this.program,
    required this.unitWithImage,
    required this.onBackPressed,
    required this.onFinishedProgramPressed,
    this.isUnitBookmarkedPage = false,
    this.fromAutoPlay = false,
  });
}

class UnitDetailPage extends StatefulWidget {
  UnitDetailPageObject? unitDetailPageObject;

  UnitDetailPage({
    Key? key,
    this.unitDetailPageObject,
  }) : super(key: key);

  // })  : assert(unitRef != null),
  //       super(key: key);

  @override
  _UnitDetailPageState createState() => _UnitDetailPageState();
}

class _UnitDetailPageState extends State<UnitDetailPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  AudioPlayer _player = AudioPlayer();
  UnitProgramState? _state;
  bool isCompleted = false;
  UnitWithImage? _currentUnitWithImage;
  StreamController<bool>? _bookmarkController;
  ScrollController _scrollController = ScrollController();
  bool _audioEnd = false;
  final UnitProgramCubit cubit = locator<UnitProgramCubit>();

  @override
  void initState() {
    BannerUtils.checkVisibility('unit');
    super.initState();
    _bookmarkController = StreamController<bool>.broadcast();
    super.initState();

    _scrollController.addListener(() {
      final position = _scrollController.position;
      final maxScrollExtent = position.maxScrollExtent;
      final currentScroll = position.pixels;

      if (currentScroll == maxScrollExtent) {
        if (cubit.state.unit?.content != null &&
            cubit.state.unit!.content!.isNotEmpty) {
          cubit.updateIsRead(isRead: true);
          WidgetsBinding.instance.addPostFrameCallback((_) async{
            _scrollController.animateTo(maxScrollExtent, duration: Duration(milliseconds: 10),curve: Curves.easeIn);
          });

          isCompleted = true;
          locator<UnitProgramCubit>().readUnit(
              programId: widget.unitDetailPageObject?.program?.id ?? " ",
              unitId: _state?.unit?.id ?? " ");
        }
      }
    });
  }

  bool isAudioMayorPartCompleted() {
    const double MINIMUM_PLAYBACK_PERCENT = 80.0;
    double playbackPercent =
        (_player.position.inSeconds / (_player.duration?.inSeconds ?? 0)) * 100;

    return playbackPercent > MINIMUM_PLAYBACK_PERCENT;
  }

  bool isAudioCompleted() {
    return _player.position.inSeconds > 0 &&
        _player.position.inSeconds >= (_player.duration?.inSeconds ?? 0);
  }

  Future<void> _initAudio() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    if (_player.playing) return;
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());

    _player.positionStream.listen((Duration position) async {
      if (isAudioMayorPartCompleted() && !isCompleted) {
        isCompleted = true;
        locator<UnitProgramCubit>().readUnit(
            programId: widget.unitDetailPageObject?.program?.id ?? " ",
            unitId: _state?.unit?.id ?? " ");
      }
      if (isAudioCompleted() && !_audioEnd) {
        _audioEnd = true;
        if (widget.unitDetailPageObject != null) {
          try {
            if (PreferenceUtils.getAutoPlay()) {
              _player.dispose();
            }
            _player.stop();

            await ProgramsUtils().evalueUnitByFirebase(context,
                onFinishedProgramPressed:
                    widget.unitDetailPageObject!.onFinishedProgramPressed,
                programId: widget.unitDetailPageObject!.program?.id ?? " ",
                unit: cubit.state.unit ?? Unit(),
                program: widget.unitDetailPageObject!.program ?? Program(),
                activeAutoPlay: PreferenceUtils.getAutoPlay(),
                onNextPressed: () =>
                    {widget.unitDetailPageObject!.onBackPressed},
                onBackPressed: widget.unitDetailPageObject!.onBackPressed);
          } catch (e) {
          }
        }
      }
    });

    // Listen to errors during playback.

    String audioUrl = await FirebasePublicationRepository().getStorageUrl(
        url: _state == null
            ? widget.unitDetailPageObject!.unitWithImage!.unit.audio!
            : _state!.unit!.audio!);
    if (mounted) {
      // Try to load audio from a source and catch any errors.
      try {
        await _player.setAudioSource(AudioSource.uri(Uri.parse(audioUrl)));
        if (widget.unitDetailPageObject != null) {
          bool autoPlayIsEnabled = PreferenceUtils.getAutoPlay();
          if (widget.unitDetailPageObject!.fromAutoPlay && autoPlayIsEnabled) {
            _player.play();
          }
        }
      } catch (e) {
        print("Error loading audio source: $e");
      }
    }
  }

  @override
  void dispose() {
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.

    _player.stop();
    //_player.dispose();

    _bookmarkController?.close();
    _scrollController.removeListener(() {});
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      if (_state != null && _state!.unit!.audio!.isNotEmpty) {
        _player.stop();
      }
    }
  }

  /// Collects the data useful for displaying in a seek bar, using a handy
  /// feature of rx_dart to combine the 3 streams of interest into one.
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) =>
              PositionData(position, bufferedPosition, duration));

  @override
  Widget build(BuildContext context) {
    if (widget.unitDetailPageObject!.unitWithImage != null) {
      _configAudioPlayer();
      return _buildAudioContent(
        context,
        onBackPressed: widget.unitDetailPageObject!.onBackPressed!,
        unitWithImage: widget.unitDetailPageObject!.unitWithImage!,
        program: widget.unitDetailPageObject!.program!,
        isUnitBookmarkedPage:
            widget.unitDetailPageObject!.isUnitBookmarkedPage!,
        onFinishedProgramPressed:
            widget.unitDetailPageObject!.onFinishedProgramPressed,
      );
    }

    return _getDataFromBackend(
      context,
      onBackPressed: widget.unitDetailPageObject!.onBackPressed!,
    );
  }

  void _configAudioPlayer() {
    _initAudio();
  }

  Widget _getDataFromBackend(
    BuildContext context, {
    required Function() onBackPressed,
  }) {
    return BlocBuilder<UnitProgramCubit, UnitProgramState>(
      bloc: cubit..init(unitId: widget.unitDetailPageObject!.unitRef!.id),
      builder: (context, state) {
        if (state.status == StatusCubit.LOADING) {
          return _buildContentForUnitLoading(context);
        }

        if (state.status == StatusCubit.SUCCESS) {
          _state = state;
          bool isAudioUnit = false;
          if (state.unit!.audio!.isNotEmpty) {
            // _player = AudioPlayer();
            // _initAudio();
            isAudioUnit = true;
            _configAudioPlayer();
          }

          _currentUnitWithImage = UnitWithImage(
            image: widget.unitDetailPageObject!.program!.poster,
            unit: state.unit!,
          );

          return _buildAudioContent(
            context,
            onBackPressed: onBackPressed,
            unitWithImage: _currentUnitWithImage!,
            program: widget.unitDetailPageObject!.program!,
            isUnitBookmarkedPage:
                widget.unitDetailPageObject!.isUnitBookmarkedPage!,
            onFinishedProgramPressed:
                widget.unitDetailPageObject!.onFinishedProgramPressed,
          );
        }

        return Container();
      },
    );
  }

  Scaffold _buildContentForUnitLoading(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: getScreenHeight(context),
        color: DanaTheme.paletteWhite,
        child: Center(
          child: CircularProgressIndicator(
            color: DanaTheme.paletteGreyTonesLightGrey20,
          ),
        ),
      ),
    );
  }

  Scaffold _buildAudioContent(
    BuildContext context, {
    required UnitWithImage unitWithImage,
    required Program program,
    required Function() onBackPressed,
    required VoidCallback? onFinishedProgramPressed,
    required bool isUnitBookmarkedPage,
  }) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(
        program: program,
        unit: unitWithImage.unit,
        onBackPressed: onBackPressed,
        isUnitBookmarkedPage: isUnitBookmarkedPage,
      ),
      body: _buildMainContent(context,
          unitWithImage: unitWithImage,
          program: program,
          onBackPressed: onBackPressed,
          onFinishedProgramPressed: onFinishedProgramPressed),
    );
  }

  Scrollbar _buildMainContent(
    BuildContext context, {
    required UnitWithImage unitWithImage,
    required Program? program,
    required VoidCallback? onBackPressed,
    required VoidCallback? onFinishedProgramPressed,
  }) {
    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      child: Container(
        height: getScreenHeight(context),
        color: DanaTheme.paletteLightGrey,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              HeaderUnitDetailWidget(unit: unitWithImage.unit),
              unitWithImage.unit.audio!.isNotEmpty
                  ? _contentAudio(unitWithImage.image)
                  : Container(height: 0),
              unitWithImage.unit.content!.isNotEmpty
                  ? UnitTextContentWidget(unit: unitWithImage.unit)
                  : Container(height: 0),
              (widget.unitDetailPageObject?.program != null)
                  ? StreamBuilder<PositionData>(
                      stream: _positionDataStream,
                      builder: (context, snapshot) {
                        return BlocBuilder<UnitProgramCubit, UnitProgramState>(
                          bloc: cubit,
                          builder: (context, state) {
                            return WillPopScope(
                              onWillPop: () async {
                                if (unitWithImage.unit.order! > 0) {
                                  var prevUnitRef = program?.unitsRefs?[
                                          unitWithImage.unit.order! - 1] ??
                                      null;
                                  if (prevUnitRef != null) {
                                    _player.dispose();
                                    context.pushNamed(
                                      AppRoutes.unitDetail.name,
                                      extra: UnitDetailPageObject(
                                        onBackPressed: onBackPressed,
                                        onFinishedProgramPressed:
                                            onFinishedProgramPressed,
                                        program: program,
                                        unitRef: prevUnitRef,
                                        unitWithImage: null,
                                      ),
                                    );
                                  } else {
                                    return true;
                                  }
                                } else if (program != null) {
                                  onBackPressed!();
                                  print("Program Id : ${program.id}");
                                  context.goNamed(
                                    AppRoutes.programDetailPage.name,
                                    queryParams: {
                                      'programId': program.id,
                                    },
                                    extra: ProgramDetailArguments(
                                      programId: program.id,
                                      onBackPressed: () {},
                                    ),
                                  );
                                } else {
                                  onBackPressed!();
                                }
                                return false;
                              },
                              child: UnitFooterWidget(
                                player: _player,
                                isFinish:
                                    isAudioMayorPartCompleted() || state.isRead,
                                startNavigation: () {
                                  _player.dispose();
                                  _player.stop();
                                },
                                onFinishedProgramPressed:
                                    onFinishedProgramPressed,
                                onPressed:
                                    widget.unitDetailPageObject!.onBackPressed!,
                                onPreviousUnit: () {
                                  if (unitWithImage.unit.order! > 0) {
                                    var prevUnitRef = program?.unitsRefs?[
                                            unitWithImage.unit.order! - 1] ??
                                        null;
                                    if (prevUnitRef != null) {
                                      _player.dispose();
                                      context.pushNamed(
                                        AppRoutes.unitDetail.name,
                                        extra: UnitDetailPageObject(
                                          onBackPressed: onBackPressed,
                                          onFinishedProgramPressed:
                                              onFinishedProgramPressed,
                                          program: program,
                                          unitRef: prevUnitRef,
                                          unitWithImage: null,
                                        ),
                                      );
                                    } else {
                                      context.pop();
                                    }
                                  } else if (program != null) {
                                    onBackPressed!();
                                    context.goNamed(
                                        AppRoutes.programDetailPage.name,
                                        extra: ProgramDetailArguments(
                                            programId: program.id,
                                            onBackPressed: () {}));
                                  } else {
                                    onBackPressed!();
                                  }
                                },
                                unit: unitWithImage.unit,
                                program: widget.unitDetailPageObject!.program!,
                              ),
                            );
                          },
                        );
                      })
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  ProgressAppBar _buildAppBar(
      {required Unit unit,
      required Program? program,
      required VoidCallback? onBackPressed,
      required bool isUnitBookmarkedPage}) {
    return ProgressAppBar(
      onBackPressed: () async {
        if (unit.audio != null && unit.audio!.isNotEmpty) _player.stop();
        if (program != null && isUnitBookmarkedPage == false) {
          onBackPressed!();
          context.goNamed(
            AppRoutes.programDetailPage.name,
            queryParams: {
              "programId": program.id,
            },
            extra: ProgramDetailArguments(
              programId: program.id,
              onBackPressed: () {},
            ),
          );
        } else {
          context.pop();
          onBackPressed!();
        }
      },
      title: widget.unitDetailPageObject?.program != null
          ? widget.unitDetailPageObject?.program?.title
          : unit.title,
      appBarType: AppBarType.TITLE_BACK,
      styleTitle: DanaTheme.textSuperSmallTextBold(DanaTheme.paletteDarkBlue),
      bgColor: DanaTheme.paletteLightGrey,
      currentValue: unit.order! + 1,
      totalValue: widget.unitDetailPageObject?.program != null
          ? widget.unitDetailPageObject?.program?.unitsRefs?.length
          : 0,
      horizontalPadding: 15,
      actions: _buildActions(unit),
    );
  }

  List<Widget> _buildActions(Unit unit) {
    final imageUrl = widget.unitDetailPageObject?.program != null
        ? widget.unitDetailPageObject?.program?.poster
        : widget.unitDetailPageObject?.unitWithImage?.image;

    final UnitWithImage unitWithImage = UnitWithImage(
      image: imageUrl,
      unit: unit,
    );
    final bool unitIsPersisted = checkIfUnitIsBookmarked(unitWithImage);

    return [
      Padding(
        padding: const EdgeInsets.only(right: 2),
        child: StreamBuilder<bool>(
          stream: _bookmarkController!.stream,
          initialData: unitIsPersisted,
          builder: (_, snapshot) {
            final bool newValue = snapshot.data!;

            return IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              icon: Icon(
                newValue ? Icons.bookmark : Icons.bookmark_border,
                color: DanaTheme.paletteDarkBlue,
              ),
              onPressed: () => _toggleBookmark(newValue),
            );
          },
        ),
      )
    ];
  }

  void _toggleBookmark(bool newValue) {
    if (newValue) {
      _unBookmark();
      return;
    }
    _bookmark();
  }

  void _bookmark() {
    DanaAnalyticsService.trackUnitBookmarked(
        _currentUnitWithImage?.unit.id ??
            widget.unitDetailPageObject!.unitWithImage!.unit.id,
        true);
    setUnitBookmarked(_currentUnitWithImage);
    _bookmarkController!.sink.add(true);
  }

  void _unBookmark() {
    DanaAnalyticsService.trackUnitBookmarked(
        _currentUnitWithImage?.unit.id ??
            widget.unitDetailPageObject!.unitWithImage!.unit.id,
        false);
    setUnitUnBookmarked(
        _currentUnitWithImage ?? widget.unitDetailPageObject!.unitWithImage);
    _bookmarkController!.sink.add(false);

    if (widget.unitDetailPageObject!.isUnitBookmarkedPage == true) {
      context.pop();
    }
  }

  Widget _contentAudio(String? image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Display play/pause button and volume/speed sliders.
        BackgroundImageUnit(
          image: image,
          player: _player,
        ),

        // Display seek bar. Using StreamBuilder, this widget unitDetailPageObject!.rebuilds
        // each time the position, buffered position or duration changes.
        StreamBuilder<PositionData>(
          stream: _positionDataStream,
          builder: (context, snapshot) {
            final positionData = snapshot.data;
            return Column(
              children: [
                SeekBar(
                  duration: positionData?.duration ?? Duration.zero,
                  position: positionData?.position ?? Duration.zero,
                  bufferedPosition:
                      positionData?.bufferedPosition ?? Duration.zero,
                  onChangeEnd: _player.seek,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
