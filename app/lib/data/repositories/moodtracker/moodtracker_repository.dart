abstract class MoodtrackerRepository {
  Future<void> setUserMoods(
      {required int emotionSelected, required String comment});
}
