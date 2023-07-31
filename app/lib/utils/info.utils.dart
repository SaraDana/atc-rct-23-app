//IMPORT EXTERN APP
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//IMPORT LOCAL APP
import 'package:app/config/constants.dart';
import 'package:app/data/services/dana_analytics_service.dart';

class InfoUtils {
  void acceptRules(BuildContext context) {
    DanaAnalyticsService.trackCommunityRulesAccepted();

    var obj = {"lastAcceptedCommunityRules": Timestamp.now()};

    FirebaseFirestore.instance
        .collection(COLLECTION_USERS)
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .set(obj, SetOptions(merge: true))
        .then((value) {
      Navigator.of(context).maybePop();
    });
  }

  Widget moodTrackerFooter() {
    return SizedBox(
      height: 40,
    );
  }

  double infoIntraSectionMargin() {
    return 20;
  }

  double infoInterSectionMargin() {
    return 25;
  }

  double infoListItemsMargin() {
    return 8;
  }
}
