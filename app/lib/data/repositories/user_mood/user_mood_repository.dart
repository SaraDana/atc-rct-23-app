//IMPORT LOCAL APP
import 'package:app/models/user_mood_model.dart';

abstract class UserMoodRepository {
  Future<List<UserMood>> getAllUserMoods();
  Future<UserMood> getUserMoodById();
}
