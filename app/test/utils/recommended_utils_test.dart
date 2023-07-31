import 'package:app/config/constants.dart';
import 'package:app/data/repositories/program/firebase_program_repository.dart';
import 'package:app/data/repositories/user_units/firebase_user_units_repository.dart';
import 'package:app/features/user/data/repositories/firebase_user_repository.dart';
import 'package:app/features/user/domain/models/new_user_model.dart';
import 'package:app/models/program_model.dart';
import 'package:app/models/unit_model.dart';
import 'package:app/models/user_units_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/utils/recommended.utils.dart';

void main(){
  group('specific recommendations for mothers and pregnant women', () {
    test('mothers', (){
      expect(RecommendedUtils().getRecommendedPostIdForMothers(5), equals("mSSXxu0XEPx9XCSsM3Sq"));
      expect(RecommendedUtils().getRecommendedPostIdForMothers(10), equals("ucKWkTiXpgRFrSArhvqB"));
      expect(RecommendedUtils().getRecommendedPostIdForMothers(0), equals("pscJMChb0rmlkTV5jdJ9"));
      expect(RecommendedUtils().getRecommendedPostIdForMothers(-1), equals(null));
      expect(RecommendedUtils().getRecommendedPostIdForMothers(93), equals("8LHl1403vON0H8CidDwW"));
      expect(RecommendedUtils().getRecommendedPostIdForMothers(92), equals("8LHl1403vON0H8CidDwW"));
      expect(RecommendedUtils().getRecommendedPostIdForMothers(94), equals(null));
      expect(RecommendedUtils().getRecommendedPostIdForMothers(99), equals(null));
      expect(RecommendedUtils().getRecommendedPostIdForMothers(100), equals(null));
      expect(RecommendedUtils().getRecommendedPostIdForMothers(105), equals(null));
    });

    test('getRecommendedPregnancyPostId', (){
      expect(RecommendedUtils().getRecommendedPregnancyPostId(-1), equals(null));
      expect(RecommendedUtils().getRecommendedPregnancyPostId(43), equals(null));
      expect(RecommendedUtils().getRecommendedPregnancyPostId(105), equals(null));

      expect(RecommendedUtils().getRecommendedPregnancyPostId(42), equals("YHrmLeddPuvpAb7wmjtt"));
      expect(RecommendedUtils().getRecommendedPregnancyPostId(34), equals("dJfUdbjKecU9WsMHmz4C"));
      expect(RecommendedUtils().getRecommendedPregnancyPostId(23), equals("AsXeMECAYzct3VThn3w6"));
      expect(RecommendedUtils().getRecommendedPregnancyPostId(11), equals("ZJq9oo3Vk8RBUoHBpeP7"));
      expect(RecommendedUtils().getRecommendedPregnancyPostId(5), equals("IZos2eT642FeI0ZqOu6v"));

    });
  });
}