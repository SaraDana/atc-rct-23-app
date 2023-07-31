//IMPORT EXTERN APP
import 'dart:async';

import 'package:app/core/di/locator.dart';
import 'package:app/cubits/myprogress/cubit/myprogress_cubit.dart';
import 'package:app/data/repositories/program/firebase_program_repository.dart';
import 'package:app/data/repositories/user_units/firebase_user_units_repository.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/generated/l10n.dart';
//IMPORT INTERN APP
import 'package:app/models/program_model.dart';
import 'package:app/models/user_units_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/globals.dart';
import 'package:app/widgets/profile/tab_convert_extension/extension.dart';
import 'package:app/widgets/program/program_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widges/my_weeks_tab_widget.dart';

class MyProgress extends StatefulWidget {
  String? tabIdComingFromDeepLinks;

  MyProgress({required this.tabIdComingFromDeepLinks, Key? key})
      : super(key: key);

  @override
  State<MyProgress> createState() => _MyProgressState();
}

class _MyProgressState extends State<MyProgress>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  StreamController<bool>? _showDataController;

  late List<ProgramWithUnits> _programList;
  int? _selectedTabIndex;
  int? _tabCount;

  Future setTabCount() async {
    return await locator<MyprogressCubit>().setTabCount();
  }

  @override
  void initState() {
    super.initState();
    setTabCount().then((value) {
      setState(() {
        _tabCount = value;
      });
      _tabController = TabController(length: _tabCount ?? 2, vsync: this);
      _tabController!.index = widget.tabIdComingFromDeepLinks
          .toString()
          .convertTabIdToIndex(_tabCount);

      this._tabController!.addListener(() {
        if (this._tabController!.indexIsChanging) {
          DanaAnalyticsService.trackOpenedMyProgressPageSection(this
              ._tabController!
              .index
              .convertTabIndexToSectionName(_tabCount ?? 2));

          return;
        }

        this._selectedTabIndex = this._tabController!.index;

        this._getData(this._selectedTabIndex);
      });
    });

    _showDataController = StreamController<bool>.broadcast();

    _selectedTabIndex = 0;

    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => _getData(_selectedTabIndex));
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _showDataController?.close();
    super.dispose();
  }

  Future<void> _getData(int? index) async {
    if (_tabCount != null && _tabCount == 3 && index == 0) return;

    final programs = await _getPrograms();

    _programList = [];

    for (var i = 0; i < programs.length; i++) {
      final program = programs[i];
      this._programList.add(await _getUnitsPrograms(program));
    }

    _showDataController!.sink.add(true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyprogressCubit, MyprogressState>(
      bloc: locator<MyprogressCubit>(),
      builder: (context, MyprogressState state) {
        if (state is MyprogressInitial && _tabCount == null) {
          return Padding(
            padding: EdgeInsets.all(100),
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: DanaTheme.paletteDanaPink,
                color: DanaTheme.paletteFPink,
              ),
            ),
          );
        }
        if (state is MyprogressLoading) {
          return Padding(
            padding: EdgeInsets.all(100),
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: DanaTheme.paletteDanaPink,
                color: DanaTheme.paletteFPink,
              ),
            ),
          );
        }
        if (state is MyprogressLoaded) {
          return StreamBuilder<bool>(
            stream: _showDataController!.stream,
            builder: (_, snapshot) {
              final value = snapshot.data ?? false;

              if (!value) {
                return Padding(
                  padding: EdgeInsets.all(100),
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: DanaTheme.paletteDanaPink,
                      color: DanaTheme.paletteFPink,
                    ),
                  ),
                );
              }

              return Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * .8,
                child: Column(
                  children: [
                    Theme(
                      data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: Container(
                        child: TabBar(
                          controller: _tabController,
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(width: 2.0),
                          ),
                          tabs: [
                            if (_tabCount == 3 && _tabCount != null)
                              Tab(
                                child: Text(
                                  S.current.myProgressTabTextMisSemanas,
                                  style: DanaTheme.bodyText1.copyWith(
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            Tab(
                                child: Text(
                              S.current.myProgressTabTextIniciados,
                              style: DanaTheme.bodyText1.copyWith(
                                fontSize: 12.sp,
                              ),
                            )),
                            Tab(
                                child: Text(
                              S.current.myProgressTabTextCompletados,
                              style: DanaTheme.bodyText1.copyWith(
                                fontSize: 12.sp,
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        // color: Colors.red,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            if (_tabCount == 3 && _tabCount != null)
                              Container(
                                padding: const EdgeInsets.only(top: 20),
                                child: MyWeekTabWidget(
                                  userWeek: state.userWeek,
                                  allSections: state.sectios,
                                ),
                              ),
                            Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: _showData(this._programList, false),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: _showData(this._programList, true),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return Center(
            child: Text("Someting goes wrong!"),
          );
        }
      },
    );
  }

  Widget _showData(List<ProgramWithUnits> programsWithUnits, bool completed) {
    final inProgressPrograms = programsWithUnits.where((programWithUnits) {
      final progress = calculateProgramProgress(
        programWithUnits.program!,
        programWithUnits.units!.length,
      );

      if (completed) {
        return progress == 1.0;
      }

      return progress < 1.0;
    }).toList();

    return Container(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.1),
        ),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: inProgressPrograms.length,
        itemBuilder: (_, index) {
          final programWithUnits = inProgressPrograms[index];
          return Container(
            child: ProgramItemWidget(
              isWeekProgram: false,
              contextPage: context,
              programPath: programWithUnits.program!.reference!.path,
              programId: programWithUnits.program!.id,
              position: index,
              checkFirstPosition: false,
              showHorizontal: false,
              onPressed: () {
                _getData(this._selectedTabIndex);
              },
              tagFilter: '',
            ),
          );
        },
      ),
    );
  }

  Future<List<Program>> _getPrograms() async {
    var allPrograms = await FirebaseProgramRepository().getAllPrograms();
    var userUnits = await FirebaseUserUnitsRepository().getAllUserUnits();

    var userProgramsIds = userUnits.map((element) => element.programId);

    var userStartedPrograms = allPrograms
        .where((element) => userProgramsIds.contains(element.id))
        .toList();
    return userStartedPrograms;
  }

  Future<ProgramWithUnits> _getUnitsPrograms(Program program) async {
    // final units = await UserUnitsRepository()
    //     .getAllUserUnitsByProgramId(program.id)
    //     .first;

    List<UserUnits> units = await FirebaseUserUnitsRepository()
        .getAllUserUnitsByProgramId(program.id!);
    ProgramWithUnits programWithUnits = ProgramWithUnits(
      program: program,
      units: units,
    );
    return programWithUnits;
  }
}

class ProgramWithUnits {
  Program? program;
  List<UserUnits>? units;

  ProgramWithUnits({
    this.program,
    this.units,
  });
}
