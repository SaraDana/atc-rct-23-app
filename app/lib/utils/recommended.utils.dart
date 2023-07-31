//IMPORT EXTERN APP
import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:app/core/di/locator.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/features/user/data/repositories/firebase_user_repository.dart';
import 'package:app/features/user/domain/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

//IMPORT INTERN APP
import 'package:app/config/constants.dart';
import 'package:app/cubits/recommended_programs/recommended_programs_cubit.dart';
import 'package:app/models/program_model.dart';
import 'package:app/models/publication_model.dart';
import 'package:app/models/recommended_post_model.dart';
import 'package:app/models/recommended_program_model.dart';
import 'package:app/models/user_units_model.dart';
import 'package:app/data/repositories/program/firebase_program_repository.dart';
import 'package:app/data/repositories/publication/firebase_publication_repository.dart';
import 'package:app/data/repositories/user_units/firebase_user_units_repository.dart';
import 'package:app/utils/globals.dart';

import '../features/user/domain/models/new_user_model.dart';
import '../models/vital_moment_recommended_post_model.dart';

class RecommendedUtils {
  getRecommendedSpecialPosts(BuildContext context) async {
    VitalMomentRecommendedPostModel? motherRecommendedPostModel = await getRecommendedMotherPost();
    VitalMomentRecommendedPostModel? pregnancyRecommendedPostModel = await getRecommendedPregnancyPost();

    if(motherRecommendedPostModel != null){
      BlocProvider.of<RecommendedProgramsCubit>(context)
          .addMotherRecommendedPost(newPost: motherRecommendedPostModel);
    }
    else {
      BlocProvider.of<RecommendedProgramsCubit>(context)
          .removeMotherRecommendedPost();
    }
    if(pregnancyRecommendedPostModel != null){
      BlocProvider.of<RecommendedProgramsCubit>(context)
          .addPregnancyRecommendedPost(newPost: pregnancyRecommendedPostModel);
    }
    else {
      BlocProvider.of<RecommendedProgramsCubit>(context)
          .removePregnancyRecommendedPost();
    }
  }

  getRecommendedPost(
    BuildContext context,
  ) async {
    getRecommendedSpecialPosts(context);
    RecommendedPostModel recommendedLocalPostModel =
        await getRecommendedLocalPost();

    if (recommendedLocalPostModel.day != null &&
        recommendedLocalPostModel.day == DateTime.now().day) {
      BlocProvider.of<RecommendedProgramsCubit>(context)
          .addTodayRecommendedPost(newPost: recommendedLocalPostModel);

      return;
    }

    InitialProfileMoment? userProfileMomet =
        locator<InitialProfileCubit>().state.initialProfileMoment;

    String idProfileMoment = profileMomentToTagId(userProfileMomet ?? InitialProfileMoment.NONE_OF_THE_ABOVE);


    var tagIdRecommendedPublication =
        (idProfileMoment == "") ? null : idProfileMoment;
    var allPublicatios = await FirebasePublicationRepository()
        .getRecommendedPublications(tagId: tagIdRecommendedPublication);

    List<Publication> allPosts = allPublicatios;

    // generates a new Random object
    final _random = new Random();

    List<Publication> userRecommendedPosts = [];

    userRecommendedPosts.addAll(allPosts
        .where((element) => element.tags!.contains(idProfileMoment))
        .toList());


    // generate a random index based on the list length
    // and use it to retrieve the element
    Publication? userRandomPost;
    if (userRecommendedPosts.isEmpty) {
      userRandomPost = allPosts[_random.nextInt(allPosts.length)];
    } else {
      userRandomPost =
          userRecommendedPosts[_random.nextInt(userRecommendedPosts.length)];
    }


    RecommendedPostModel todayRecommendedPost = RecommendedPostModel(
      publication: userRandomPost,
      day: DateTime.now().day,
    );

    await setRecommendedLocalPost(todayRecommendedPost: todayRecommendedPost);
    BlocProvider.of<RecommendedProgramsCubit>(context)
        .addTodayRecommendedPost(newPost: todayRecommendedPost);
  }

  Future<List<Program>> getUserStartedProgramsSortedByLastUnitSeen(
      List<UserUnits> userUnits, List<Program> allPrograms) async {
    userUnits.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
    var userProgramsIds = userUnits.map((element) => element.programId);
    List<Program> userStartedPrograms = allPrograms
        .where((element) => userProgramsIds.contains(element.id))
        .toList();
    for (var i = 0; i < userStartedPrograms.length; i++) {
      userStartedPrograms[i].createdAt = userUnits
          .where((element) => element.programId == userStartedPrograms[i].id)
          .last
          .createdAt;
    }
    userStartedPrograms.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    return userStartedPrograms;
  }

  sendBlocEventsIfAllProgramsOrNoProgramsStarted(int userStartedProgramsCount,
      int allProgramsCount, BuildContext context) {
    if (userStartedProgramsCount != 0 &&
        userStartedProgramsCount != allProgramsCount) {
      BlocProvider.of<RecommendedProgramsCubit>(context).userStartedPrograms();
    }
    if (userStartedProgramsCount == allProgramsCount) {
      BlocProvider.of<RecommendedProgramsCubit>(context).userEndPrograms();
    }
  }

  String getProfileMomentId(BuildContext context) {
    InitialProfileMoment? userProfileMoment =
        locator<InitialProfileCubit>().state.initialProfileMoment;
    String idProfileMoment = profileMomentToTagId(userProfileMoment ?? InitialProfileMoment.NONE_OF_THE_ABOVE);
    return idProfileMoment;
  }

  List<Program> getProgramsWithTag(List<Program> programs, String tag) {
    List<Program> programsWithTags = programs
        .where((element) => element.tagsRefs!.map((t) => t.id).contains("$tag"))
        .toList();
    return programsWithTags;
  }

  recommendProgramForToday(BuildContext context, Program program) async {
    RecommendedProgramModel todayProgramRecommended = RecommendedProgramModel(
        programId: program.id,
        programPath: program.reference!.path,
        timestamp: DateTime.now());
    await setRecommendedLocalProgram(
        todayRecommendedProgram: todayProgramRecommended);
    BlocProvider.of<RecommendedProgramsCubit>(context)
        .addTodayRecommendedProgram(newProgram: todayProgramRecommended);
  }

  Map<String, Program> getMapFromProgramsList(List<Program> programs) {
    Map<String, Program> programsMap = new HashMap<String, Program>();

    for (Program p in programs) {
      if (p.id != null) programsMap[p.id!] = p;
    }

    return programsMap;
  }

  Map<String, List<String>> getFromProgramIdToUnitIdMapFromUserUnitsList(
      List<UserUnits> units) {
    Map<String, List<String>> unitsMap = new HashMap<String, List<String>>();

    for (UserUnits u in units) {
      if (u.programId != null && u.unitId != null) {
        List<String>? currentList = unitsMap[u.programId!];
        if (currentList == null) {
          currentList = [];
        }
        currentList.add(u.unitId!);
        unitsMap[u.programId!] = currentList;
      }
    }

    return unitsMap;
  }

  List<Program> getUserNotStartedPrograms(List<Program> allPrograms, List<Program> userStartedPrograms) {
    List<Program> userNotStartedPrograms = allPrograms;
    userNotStartedPrograms.removeWhere(
            (element) => userStartedPrograms.map((e) => e.id).contains(element.id));
    return userNotStartedPrograms;
  }
//Alghoritm to get the next unit to see
  Future<Object> getRecommendedProgramForUser(List<Program> allPrograms, String userId, String idProfileMoment, List<Program> userStartedPrograms) async{
    List<Program> userNotStartedPrograms = getUserNotStartedPrograms(allPrograms, userStartedPrograms);

    RecommendedProgramModel recommendedLocalProgram =
    await getRecommendedLocalProgram();
    final user = await FirebaseUserRepository()
        .getUserById(userId);
    RecommendedProgramModel? recommendedFirstProgram =
    await getRecommendedFirstDayProgram(user);
    if (recommendedFirstProgram != null) {
      return recommendedFirstProgram;
    } else if (recommendedLocalProgram.timestamp == null ||
        recommendedLocalProgram.timestamp!.day != DateTime.now().day) {
      final _random = new Random();
      List<Program> programsWithTags =
      getProgramsWithTag(userNotStartedPrograms, idProfileMoment);
      if (programsWithTags.isEmpty) {
        Program userNotStartedProgramsRandom = userNotStartedPrograms[
        _random.nextInt(userNotStartedPrograms.length)];
        return userNotStartedProgramsRandom;
      } else {
        var finalRecommendedProgramRandom =
        programsWithTags[_random.nextInt(programsWithTags.length)];
        return finalRecommendedProgramRandom;
      }
    } else {
      return recommendedLocalProgram;
    }
  }

  updateRecommendedProgramsProgress(BuildContext context, List<UserUnits> userUnits, List<Program> userStartedPrograms) {
    Map<String, List<String>> programIdToUserUnitIdsMap =
    getFromProgramIdToUnitIdMapFromUserUnitsList(userUnits);
    for (var i = 0; i < userStartedPrograms.length; i++) {
      int? unitsByProgram =
          programIdToUserUnitIdsMap[userStartedPrograms[i].id]?.length;
      if (unitsByProgram == null) continue;
      double progress = calculateProgramProgress(
        userStartedPrograms[i],
        unitsByProgram,
      );

      if (progress < 1) {
        RecommendedProgramModel newProgram = RecommendedProgramModel(
          programId: userStartedPrograms[i].id!,
          programPath: userStartedPrograms[i].reference!.path,
        );
        // add newProgram (avoiding repetitions)
        List<RecommendedProgramModel> newListElements = context
            .read<RecommendedProgramsCubit>()
            .state
            .recommendedPrograms
            .where((element) => element.programId != newProgram.programId)
            .toList();
        newListElements.add(newProgram);
        BlocProvider.of<RecommendedProgramsCubit>(context)
            .addListRecommendedPrograms(newPrograms: newListElements);
      }
    }
  }

  getRecommendedPrograms(
    BuildContext context,
  {String? recommendationUserId}
  ) async {
    BlocProvider.of<RecommendedProgramsCubit>(context)
        .addListRecommendedPrograms(newPrograms: []);

    String userId = FirebaseUserRepository().getUserId();
    var allPrograms = await FirebaseProgramRepository().getAllPrograms();

    List<UserUnits> userUnits =
    await FirebaseUserUnitsRepository().getAllUserUnits(userId:userId);
    List<Program> userStartedPrograms =
    await getUserStartedProgramsSortedByLastUnitSeen(
        userUnits, allPrograms);
    String idProfileMoment = getProfileMomentId(context);

    // send event to show a program or show "Congratulations, you saw all the programs"
    sendBlocEventsIfAllProgramsOrNoProgramsStarted(
        userStartedPrograms.length, allPrograms.length, context);

    Object recommendation = await getRecommendedProgramForUser(allPrograms, userId, idProfileMoment, userStartedPrograms);

    if(recommendation is Program){
      recommendProgramForToday(context, recommendation);
    } else if( recommendation is RecommendedProgramModel){
      BlocProvider.of<RecommendedProgramsCubit>(context)
          .addTodayRecommendedProgram(newProgram: recommendation);
    }



    updateRecommendedProgramsProgress(context, userUnits, userStartedPrograms);
  }

  Future<RecommendedProgramModel?> getRecommendedFirstDayProgram(NewUserModel? user) async {
    final DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
    final createdAt = user?.createdAt;

    if (createdAt != null && createdAt.isAfter(yesterday)) {
      final allPrograms = await FirebaseProgramRepository().getAllPrograms();

      final program =
          allPrograms.firstWhere((p) => p.id == '3mHICZGHhizMCDAwxiEC');
      return RecommendedProgramModel(
          programId: program.id,
          programPath: program.reference!.path,
          timestamp: DateTime.now());
    }

    return null;
  }

  Future<void> setRecommendedLocalProgram(
      {required RecommendedProgramModel todayRecommendedProgram}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString("todayRecommendedProgram",
          jsonEncode(todayRecommendedProgram.toJson()));
    } catch (err) {
    }
  }

  Future<RecommendedProgramModel> getRecommendedLocalProgram() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final _response = prefs.getString("todayRecommendedProgram") ?? '';
      RecommendedProgramModel newProgram =
          RecommendedProgramModel.fromJson(jsonDecode(_response));

      return newProgram;
    } catch (err) {
    }
    return RecommendedProgramModel(programId: '');
  }

  Future<void> setRecommendedLocalPost(
      {required RecommendedPostModel todayRecommendedPost}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      Map<String, dynamic> encodeData = {
        "publicationId": todayRecommendedPost.publication!.id,
        "time": DateTime.now().day.toString()
      };

      await prefs.setString("todayRecommendedPost", jsonEncode(encodeData));
    } catch (err) {
    }
  }

  Future<RecommendedPostModel> getRecommendedLocalPost() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final _response = prefs.getString("todayRecommendedPost") ?? '';

      Map<String, dynamic> _dataDecoded = jsonDecode(_response);

      RecommendedPostModel newPost = RecommendedPostModel();
      String _dataDecodedDay = _dataDecoded["time"];
      String _dataDecodedPublicationString = _dataDecoded["publicationId"];
      if (_dataDecodedPublicationString.isNotEmpty) {
        newPost.publication = await FirebasePublicationRepository()
            .getPublication(_dataDecodedPublicationString);
      }
      newPost.day = int.parse(_dataDecodedDay);

      return newPost;
    } catch (err) {
      return RecommendedPostModel();
    }
  }

  int getWeekDifference(DateTime fromDate, DateTime toDate) {
    int dayDifference = toDate.difference(fromDate).inDays;
    return dayDifference ~/ 7;
  }

  String? getRecommendedPostIdForMothers(int weeksSinceBirth) {
    const List<String?> recommendations = [
      "pscJMChb0rmlkTV5jdJ9", "pscJMChb0rmlkTV5jdJ9", "UbsvURMNNYYBd5Qq6ZVe", "UbsvURMNNYYBd5Qq6ZVe", "mSSXxu0XEPx9XCSsM3Sq",
      "mSSXxu0XEPx9XCSsM3Sq", "F3UXnDgECVclZYOBNlEb", "F3UXnDgECVclZYOBNlEb", "Mgf8fh8aB6ru5EkSP86L", "Mgf8fh8aB6ru5EkSP86L",
      "ucKWkTiXpgRFrSArhvqB", "ucKWkTiXpgRFrSArhvqB", "PT0moTZ3wvhqTimflWjQ", "PT0moTZ3wvhqTimflWjQ", "7U3oc8g6NnoNXyc3CWgI",
      "7U3oc8g6NnoNXyc3CWgI", "tXyWXqf0Vlq2S1Wyhbdn", "tXyWXqf0Vlq2S1Wyhbdn", "e2eZLpWiWOhE117Bs7ab", "e2eZLpWiWOhE117Bs7ab",
      "4vJy3nEhp2cCewdoKiRj", "4vJy3nEhp2cCewdoKiRj", "NLaY5LcPCmeOzBqI0OMo", "NLaY5LcPCmeOzBqI0OMo", "sCd3vfPKix7rmDXKo11x",
      "sCd3vfPKix7rmDXKo11x", "Z0OY1O4fhFZg7LgvSWYt", "Z0OY1O4fhFZg7LgvSWYt", "xM0ZhuW4AQOTkvNErxCy", "xM0ZhuW4AQOTkvNErxCy",
      "F5uGeTKazcwWUxdMJ3N5", "F5uGeTKazcwWUxdMJ3N5", "dQ3Txlf48Sy7Bt6EgDFM", "dQ3Txlf48Sy7Bt6EgDFM", "ghqeJsk9ea3ZeabnMg0E",
      "ghqeJsk9ea3ZeabnMg0E", "RNyTBbp5tJOikujEVIV7", "RNyTBbp5tJOikujEVIV7", "sTTYcKJHZBoz4lpxVMrm", "sTTYcKJHZBoz4lpxVMrm",
      "vzM63vM9ig6ToVFwNYB0", "vzM63vM9ig6ToVFwNYB0", "zXhcgGVp0XJRUl8pGENz", "zXhcgGVp0XJRUl8pGENz", "tzAzzELrSJxPENE2YXhf",
      "tzAzzELrSJxPENE2YXhf", "RCCp34Ym5PKivRJ0XmKC", "RCCp34Ym5PKivRJ0XmKC", "9pTB1fE0O9Zwfh4eNhZ5", "9pTB1fE0O9Zwfh4eNhZ5",
      "nESvHlUwc2o1e07YGrJD", "nESvHlUwc2o1e07YGrJD", "4NAeQZJ6MwNCXr4EqHME", "4NAeQZJ6MwNCXr4EqHME", "pRFLluiiiETXy5fiQf6c",
      "pRFLluiiiETXy5fiQf6c", "EyZuUWtvix8Bp3gBqfy0", "EyZuUWtvix8Bp3gBqfy0", "hmQkJNjs0bP9fRDMeoEP", "hmQkJNjs0bP9fRDMeoEP",
      "P1WbGESwFy4J4jebmeT8", "P1WbGESwFy4J4jebmeT8", "kwf6YkJQblK7dbpqZcvD", "kwf6YkJQblK7dbpqZcvD", "8YMO8kjgLK86SqCT17w2",
      "8YMO8kjgLK86SqCT17w2", "WTQOwlaqa3J7EdUF3T6c", "WTQOwlaqa3J7EdUF3T6c", "4ImB2EKtIuVot7ayZfEA", "4ImB2EKtIuVot7ayZfEA",
      "TiFZCdF3VaF3OWEquPId", "TiFZCdF3VaF3OWEquPId", "XgOCbcv0LE2fMzmDNCjg", "XgOCbcv0LE2fMzmDNCjg", "KQjbiVzggyjLP3vblXgb",
      "KQjbiVzggyjLP3vblXgb", "tE29H6I1kPpESPJQP9mq", "tE29H6I1kPpESPJQP9mq", "4ImB2EKtIuVot7ayZfEA", "4ImB2EKtIuVot7ayZfEA",
      "cCLTUabyUVRm2tcKwlwS", "cCLTUabyUVRm2tcKwlwS", "KkR6iWUpvBAO7FjFMZjm", "KkR6iWUpvBAO7FjFMZjm", "0Fe70n74v9yAbHos8od9",
      "0Fe70n74v9yAbHos8od9", "ndVJGnSKvm1t1oYnua1g", "ndVJGnSKvm1t1oYnua1g", "xbmcoH6yTqw8cuxK0Ztq", "xbmcoH6yTqw8cuxK0Ztq",
      "XhOMeFOUi1mueg7AS6u5", "XhOMeFOUi1mueg7AS6u5", "8LHl1403vON0H8CidDwW", "8LHl1403vON0H8CidDwW"
    ];
    if(weeksSinceBirth < 0 || weeksSinceBirth >= recommendations.length)
      return null;

    return recommendations[weeksSinceBirth];
  }

  String? getRecommendedPregnancyPostId(int weeksSincePeriod) {
    return null;
    /*const List<String?> recommendations = [
      "IZos2eT642FeI0ZqOu6v", "IZos2eT642FeI0ZqOu6v", "IZos2eT642FeI0ZqOu6v", "IZos2eT642FeI0ZqOu6v", "IZos2eT642FeI0ZqOu6v",
      "IZos2eT642FeI0ZqOu6v", "xHkGcxmhIVA2QgAaAkBz", "eISfPsMMZM9sbt1saJjT", "lZBtDBbYb9tzbCwqZkie", "awC871CaHUswaNUUFjWF",
      "6c6qi2twYlp1ECzy1lRV", "ZJq9oo3Vk8RBUoHBpeP7", "X7gCMWtoZcrosie2Ahws", "rlZfy3W8YzpNq2Hc7R8C", "sgGouh6wg9rByod5jZlh",
      "vQixKyNS6peiKWCTgJ49", "cspSaj2ZDQ3Ac6hsY85A", "bd8Pb5MbY29zJLhYoRU5", "3PUpd1TIEJevOsoNLDmK", "ahAnhj54mYHgoe4fpgQm",
      "h29CzXaZmkt2NjgMOjv8", "UZUxJokCoYmlKvjSH8Gh", "xYthID5mGb18NiLpIgRc", "AsXeMECAYzct3VThn3w6", "G4X3SA36Fgzz0el8I2xz",
      "XmYXlFrJzVIwv6C69BV9", "KoEcF1AOvaygdHgkTs8j", "mTjN3db6tSwYexj3mVIc", "hlynPNjdAgY9ASQADhd3", "prh6NLPCBeEHw5rwexoT",
      "xUbitzGnP4sldyDk9P7o", "jaZyD0fKAqjydicJzh9b", "y0zKR8eutmdc12hihUHp", "eWV1Es6DfcKuv823K6lr", "dJfUdbjKecU9WsMHmz4C",
      "CZGsm4faGoF1mlhRXzn5", "dWtu5qm3csQycLUxtjZL", "rE67RHGKuVlFcWYOl0mS", "U6mj3sytCD62BPlSZ0n5", "XqPostzea4WNjElwqIZY",
      "paC1yE2k6VpC9VoR9u5c", "9cOJSQyDEM229TVhD3cn", "YHrmLeddPuvpAb7wmjtt"
    ];
    if(weeksSincePeriod < 0 || weeksSincePeriod >= recommendations.length)
      return null;

    return recommendations[weeksSincePeriod];*/
  }

  int? getMotherWeeks(NewUserModel? user) {
    final InitialProfileMoment profileMoment =
    stringToInitialProfileMoment(user?.profileMoment ?? '');
    final DateTime? dateOfBirth = user?.childBirthDate;
    if (profileMoment != InitialProfileMoment.I_AM_ALREADY_MOTHER ||
        dateOfBirth == null) return null;
    return getWeekDifference(dateOfBirth, DateTime.now());
  }

  Future<VitalMomentRecommendedPostModel?> getRecommendedMotherPost() async {
    try {
      NewUserModel? user = await FirebaseUserRepository()
          .getUserById(FirebaseUserRepository().getUserId());
      int? weeksSinceBirth = getMotherWeeks(user);
      if(weeksSinceBirth == null)
        return null;
      String? recommendedPostId =
          getRecommendedPostIdForMothers(weeksSinceBirth);
      if (recommendedPostId == null) return null;
      VitalMomentRecommendedPostModel newPost = VitalMomentRecommendedPostModel();
      newPost.publication = await FirebasePublicationRepository()
          .getPublication(recommendedPostId);
      newPost.relatedWeek = weeksSinceBirth;
      return newPost;
    } catch (err) {
      return null;
    }
  }

  Future<VitalMomentRecommendedPostModel?> getRecommendedPregnancyPost() async {
    try {
      NewUserModel? user = await FirebaseUserRepository()
          .getUserById(FirebaseUserRepository().getUserId());
      final InitialProfileMoment profileMoment =
          stringToInitialProfileMoment(user?.profileMoment ?? '');
      final DateTime? lastPeriodDate = user?.lastPeriod;
      if (profileMoment != InitialProfileMoment.I_AM_PREGNANT ||
          lastPeriodDate == null) return null;
      int weeksSinceBirth = getWeekDifference(lastPeriodDate, DateTime.now());
      String? recommendedPostId =
          getRecommendedPregnancyPostId(weeksSinceBirth);
      if (recommendedPostId == null) return null;
      VitalMomentRecommendedPostModel newPost = VitalMomentRecommendedPostModel();
      newPost.publication = await FirebasePublicationRepository()
          .getPublication(recommendedPostId);
      newPost.relatedWeek = weeksSinceBirth;
      return newPost;
    } catch (err) {
      return null;
    }
  }
}
