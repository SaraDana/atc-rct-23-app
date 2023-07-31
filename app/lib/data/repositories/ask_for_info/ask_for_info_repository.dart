abstract class AskForInfoRepository {
  Future<bool> savePhoneNumber(
      {required String phoneNumber,
      String? courseName,
      Map<String, dynamic>? extraData});
}
