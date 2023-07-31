import '../../../models/tag_model.dart';

abstract class TagRepository {
  Future<List<Tag>> getAllTags();
  Future<Tag?> getTag(String tagId);
}
