//IMPORT INTERN APP
import 'package:app/models/answer_model.dart';
import 'package:app/models/comment_model.dart';
import 'package:app/models/publication_model.dart';
import 'package:app/models/selection_model.dart';
import 'package:app/models/social_config_model.dart';
import 'package:app/models/social_section_model.dart';
import 'package:app/models/subcomment_model.dart';
import 'package:app/models/tag_model.dart';

abstract class PublicationRepository {
  Future<String> getStorageUrl({required String url});
  Future<List<Answer>> getAnswers(String? publicationId);
  Future<Comment?> getComment(String? publicationId, String? commentId);
  Future<List<Comment>> getComments(String? publicationId);
  Future<Subcomment?> getSubcomment(
      String? publicationId, String? subcommentId);
  Future<List<Subcomment>> getSubcomments(String? publicationId);
  Future<Publication?> getPublication(String? id);
  Future<List<Publication>> getRecommendedPublications({
    String? tagId,
  });
  Future<List<Publication>> getPublications(String? tagId, String? sectionId,
      [useLastDoc = true]);
  Future<List<Publication>> getPublicationsSavedByUser(
      {required String userId});
  Future<List<Publication>> getPublicationsByBookmark();
  Future<List<Selection>> getSelections(
      String? publicationId, String? answerId);
  Future<SocialConfig> getSocialConfig();
  Future<List<SocialSection>> getSocialSections();
  Future<List<Tag>> getTags();
  Future<Comment> setComment(String? publicationId, String text);
  Future<Subcomment> setSubcomment(
      String? publicationId, String? idComment, String text);
  Future<Selection> setSelection(String? publicationId, String? answerId);
  Future<void> toggleCommentLike(String? publicationId, String? commentId);
  Future<void> toggleSubcommentLike(
      {required String? publicationId, required String? subcommentId});
  Future<void> togglePublicationBookmark(String? publicationId);
  Future<void> togglePublicationLike(String? publicationId);
  Future<void> reportComment(String? publicationId, String? commentId);
  Future<Publication?> enhancePublication(Publication publication);
  Future<bool> increaseCommentCount(String publicationId);
}
