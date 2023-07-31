import 'dart:developer';

import 'package:app/app.dart';
import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/data/repositories/program/firebase_program_repository.dart';
import 'package:app/data/repositories/user_units/firebase_user_units_repository.dart';
import 'package:app/features/auth/app/cubits/sign_in/sign_in_cubit.dart';
import 'package:app/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:app/features/auth/domain/repositories/auth_repository.dart';
import 'package:app/features/user/data/repositories/firebase_user_repository.dart';
import 'package:app/features/user/domain/models/new_user_model.dart';
import 'package:app/models/program_model.dart';
import 'package:app/models/user_units_model.dart';
import 'package:app/utils/recommended.utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:app/main.dart' as app;

void main(){
  // https://firebase.flutter.dev/docs/testing/testing/
  // https://docs.flutter.dev/cookbook/testing/integration/introduction

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('get correct recommended programs', (){
    setupITests()async{
      /*WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();*/

      // Run: firebase emulators:start --only firestore
      //FirebaseFirestore.instance.settings = const Settings(
      //    host: 'http://localhost:8080', sslEnabled: false, persistenceEnabled: false);
      app.main();
    }
    setUpAll(setupITests);

    assertProgramIsOkForUser(Program program, String profileMomentTagId, List<Program> allPrograms, List<Program> userStartedPrograms){
      if(profileMomentTagId != "" && userStartedPrograms.length < allPrograms.length) {
        assert(program.tagsRefs != null);
        if(program.tagsRefs != null) {
          bool? listHasTag = program.tagsRefs?.map((e) => e.id).contains(profileMomentTagId);
          expect(listHasTag, equals(true));
        }
      }
      if(userStartedPrograms.isNotEmpty && userStartedPrograms.length < allPrograms.length){
        bool isProgramNew = !userStartedPrograms.map((e) => e.id).contains(program.id);
        expect(isProgramNew, equals(true));
      }
    }

    testWidgets('Roser user recommendation', (tester) async {
      await tester.pumpAndSettle();

  /*    locator<SignInCubit>().emailChanged('sara@dana.health');
      locator<SignInCubit>().passwordChanged('SaraDana2022');
      locator<SignInCubit>().sigInWithCredentials();
*/
      AuthRepository authRepository = FirebaseAuthRepository();

      await authRepository.signInWithEmailAndPassword(
        email: '',
        password: '',
      );

      String roserId = 'HT1sF6sesgW55BuFHqiuE9E9qND3';

      var allPrograms = await FirebaseProgramRepository().getAllPrograms();
      var allProgramsReally = await FirebaseProgramRepository().getAllPrograms();

      List<UserUnits> userUnits =
      await FirebaseUserUnitsRepository().getAllUserUnits(userId:roserId);
      List<Program> userStartedPrograms =
      await RecommendedUtils().getUserStartedProgramsSortedByLastUnitSeen(
          userUnits, allPrograms);
      NewUserModel? profile = await (FirebaseUserRepository().getUserById(roserId));
      String? profileMoment = profile?.profileMoment;
      String profileMomentTagId = profileMomentToTagId(stringToInitialProfileMoment(profileMoment));

      List results = [].toList(growable: true);
      for(var i = 0; i < 100; i++) {
        allPrograms = allProgramsReally;
        Object p = await RecommendedUtils().getRecommendedProgramForUser(
            allPrograms, roserId, profileMomentTagId, userStartedPrograms);


        if (p is Program) {
          Program program = p;
          assertProgramIsOkForUser(
              program, profileMomentTagId, allProgramsReally,
              userStartedPrograms);
          results.add(program!.id!);
        }

      }


      expect(true, equals(true));
    });
  });



}


