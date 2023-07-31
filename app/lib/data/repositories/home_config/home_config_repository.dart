import '../../../models/tag_model.dart';

abstract class HomeConfigRepository {
  Future<List<Tag?>> getAllTags();
}
