import 'package:app/widgets/profile/models/program_model.dart';

class WeekModel {
  String sectionTitle;
  int sectionId;
  bool isOpened;
  List<ProgramModel> programs;
  String backgroundPath;

  WeekModel({
    required this.sectionId,
    required this.programs,
    required this.sectionTitle,
    required this.backgroundPath,
    required this.isOpened,
  });
}
