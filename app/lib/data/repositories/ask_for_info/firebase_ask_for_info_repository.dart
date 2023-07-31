import 'package:app/config/constants.dart';
import 'package:app/core/constants/api_constants.dart';
import 'package:app/data/repositories/ask_for_info/ask_for_info_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAskForInfoRepository extends AskForInfoRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  @override
  Future<bool> savePhoneNumber({required String phoneNumber, String? courseName, Map<String, dynamic>? extraData}) async{
   try {
      if (_auth.currentUser != null) {
        Map<String, dynamic>? data = {
          PropertyConstants.phoneNumber: phoneNumber,
          PropertyConstants.email: _auth.currentUser!.email,
          PropertyConstants.date: FieldValue.serverTimestamp(),
          PropertyConstants.courseName: courseName,
          ...?extraData,
        };

        await FirebaseFirestore.instance
            .collection(COLLECTION_USER_ASKING_FOR_INFO)
            .doc('${_auth.currentUser!.uid}')
            .set(data);
      }
      return true;
    } catch (e) {
      print("FirebaseAskForInfoRepository / savePhoneNumber $e");
      return false;
    }
  }

 
}
