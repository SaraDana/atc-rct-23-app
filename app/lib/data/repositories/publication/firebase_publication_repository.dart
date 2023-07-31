//IMPORT EXTERN APP
import 'dart:async';

import 'package:app/config/constants.dart';
//IMPORT INTERN APP
import 'package:app/data/repositories/publication/publication_repository.dart';
import 'package:app/features/user/data/repositories/firebase_user_repository.dart';
import 'package:app/models/answer_model.dart';
import 'package:app/models/comment_model.dart';
import 'package:app/models/publication_model.dart';
import 'package:app/models/selection_model.dart';
import 'package:app/models/social_config_model.dart';
import 'package:app/models/social_section_model.dart';
import 'package:app/models/subcomment_model.dart';
import 'package:app/models/tag_model.dart';
import 'package:app/utils/globals.dart';
import 'package:app/utils/publications.utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebasePublicationRepository extends PublicationRepository {
  final _userRepository = FirebaseUserRepository();

  @override
  Future<String> getStorageUrl({required String url}) async {
    return await _getStorageUrlFirebase(url: url);
  }

  @override
  Future<List<Answer>> getAnswers(String? publicationId) async {
    final querySnapshot = await _getAnswersFirebase(publicationId);
    final answers =
        querySnapshot.docs.map((snapshot) => snapshot.data()).toList();

    await Future.forEach<Answer>(answers, (answer) async {
      final selections = await getSelections(publicationId, answer.id);
      answer.selections = selections;
    });

    return answers;
  }

  @override
  Future<Comment?> getComment(String? publicationId, String? commentId) async {
    final querySnapshot = await _getCommentFirebase(publicationId, commentId);
    final comment = querySnapshot.data();

    return comment;
  }

  @override
  Future<List<Comment>> getComments(String? publicationId) async {
    try {
      final querySnapshot = await _getCommentsFirebase(publicationId);
      final comments =
          querySnapshot.docs.map((snapshot) => snapshot.data()).toList();

      // enhanceComment => get userName from userId
      // TODO: PMG, this call has to be done in the screens where the comments are shown
      await Future.forEach(comments, (dynamic comment) async {
        _enhanceComment(comment);
      });
      return comments;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<Subcomment?> getSubcomment(
      String? publicationId, String? subcommentId) async {
    final querySnapshot =
        await _getSubcommentFirebase(publicationId, subcommentId);
    final subcomment = querySnapshot.data();

    return subcomment;
  }

  @override
  Future<List<Subcomment>> getSubcomments(String? publicationId) async {
    final querySnapshot = await _getSubcommentsFirebase(publicationId);
    final subcomments =
        querySnapshot.docs.map((snapshot) => snapshot.data()).toList();

    // enhanceComment => get userName from userId
    for (Subcomment subcomment in subcomments) {
      await _enhanceSubcomment(subcomment);
    }

    return subcomments;
  }

  @override
  Future<Publication?> getPublication(String? id) async {
    try {
      final querySnapshot = await _getPublicationFirebase(id);
      Publication? publication = querySnapshot!.data();
      final comments = await getComments(publication!.id);
      final subcomments = await getSubcomments(publication.id);

      publication.comments = comments;
      publication.subcomments = subcomments;

      // Get answers (poll_answers) for all polls
      // Calculate percentages
      if (publication.type == PublicationType.POLL.firebaseName) {
        final answers = await getAnswers(publication.id);
        publication.answers = answers;
        publication.refreshPercentages();
      }

      return publication;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Publication>> getRecommendedPublications({
    String? tagId,
  }) async {
    final querySnapshot =
        await _getRecommendedPublicationsFirebase(tagId: tagId);

    final publications =
        querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
    List<Publication> enhancedPublication =
        await _enhancePublications(publications);

    return enhancedPublication;
  }

  @override
  Future<List<Publication>> getPublications(String? tagId, String? sectionId,
      [useLastDoc = true]) async {
    if (!useLastDoc) {
      lastDoc = null;
    }

    final querySnapshot =
        await _getPublicationsFirebase(lastDoc, tagId, sectionId);

    if (querySnapshot.docs.length > 0) {
      lastDoc = querySnapshot.docs[querySnapshot.docs.length - 1];
    }

    final publications =
        querySnapshot.docs.map((snapshot) => snapshot.data()).toList();

    await _enhancePublications(publications,isPoolPulling: true);

    return publications;
  }

  @override
  Future<List<Publication>> getPublicationsSavedByUser(
      {required String userId}) async {
    final querySnapshot =
        await _getPublicationsSavedByUserFirebase(userId: userId);

    if (querySnapshot.docs.length > 0) {
      lastDoc = querySnapshot.docs[querySnapshot.docs.length - 1];
    }

    final publications =
        querySnapshot.docs.map((snapshot) => snapshot.data()).toList();

    List<Publication> enhancedPublication =
        await _enhancePublications(publications);

    return enhancedPublication;
  }

  @override
  Future<List<Publication>> getPublicationsByBookmark() async {
    final querySnapshot = await _getPublicationsByBookmarkFirebase(
        FirebaseAuth.instance.currentUser!.uid);
    final publications =
        querySnapshot.docs.map((snapshot) => snapshot.data()).toList();

    List<Publication> enhancedPublication =
        await _enhancePublications(publications);

    return enhancedPublication;
  }

  @override
  Future<List<Selection>> getSelections(
      String? publicationId, String? answerId) async {
    final querySnapshot = await _getSelectionsFirebase(publicationId, answerId);
    final selections =
        querySnapshot.docs.map((snapshot) => snapshot.data()).toList();

    return selections;
  }

  @override
  Future<SocialConfig> getSocialConfig() async {
    final querySnapshot = await _getSocialConfigFirebase();
    final socialConfig = querySnapshot.data()!;

    // enhance socialConfig
    final tags = await getTags();
    Future.forEach(socialConfig.filters!, (Filter filter) {
      final tag = tags.firstWhere((element) => element.id == filter.tagId);
      filter.tagName = tag.name;
    });

    return socialConfig;
  }

  @override
  Future<List<SocialSection>> getSocialSections() async {
    final querySnapshot = await _getSocialSectionsFirebase();
    final socialSections =
        querySnapshot.docs.map((snapshot) => snapshot.data()).toList();

    return socialSections;
  }

  @override
  Future<List<Tag>> getTags() async {
    final querySnapshot = await _getTagsFirebase();
    final tags = querySnapshot.docs.map((snapshot) => snapshot.data()).toList();

    return tags;
  }

  @override
  Future<Comment> setComment(String? publicationId, String text) async {
    final comment = Comment(
      userId: FirebaseAuth.instance.currentUser!.uid,
      text: text,
      date: DateTime.now(),
      likedBy: [],
    );

    final newComment = await _setCommentFirebase(publicationId, comment);
    await _enhanceComment(newComment);

    return newComment;
  }

  @override
  Future<Subcomment> setSubcomment(
    String? publicationId,
    String? idComment,
    String text,
  ) async {
    final comment = Comment(
      userId: FirebaseAuth.instance.currentUser!.uid,
      text: text,
      date: DateTime.now(),
      likedBy: [],
    );

    final newSubcomment =
        await _setSubcommentFirebase(publicationId, idComment, comment);
    await _enhanceSubcomment(newSubcomment);

    return newSubcomment;
  }

  @override
  Future<Selection> setSelection(
      String? publicationId, String? answerId) async {
    final selection = Selection(
      userId: FirebaseAuth.instance.currentUser!.uid,
      date: DateTime.now(),
    );

    return await _setSelectionFirebase(publicationId, answerId, selection);
  }

  @override
  Future<void> toggleCommentLike(
      String? publicationId, String? commentId) async {
    final comment = await (getComment(publicationId, commentId));
    comment!.toogleLike(FirebaseAuth.instance.currentUser!.uid);

    return await _toggleCommentLikeFirebase(
        publicationId, commentId, comment.likedBy);
  }

  @override
  Future<void> toggleSubcommentLike(
      {required String? publicationId, required String? subcommentId}) async {
    final subcomment = await (getSubcomment(publicationId, subcommentId));
    subcomment!.toogleLike(FirebaseAuth.instance.currentUser!.uid);

    return await _toggleSubcommentLikeFirebase(
      comment: subcomment.comment!,
      likedBy: subcomment.comment!.likedBy,
      subcommentId: subcommentId,
      publicationId: publicationId,
    );
  }

  @override
  Future<void> togglePublicationBookmark(String? publicationId) async {
    final publication = await (getPublication(publicationId));
    if (publication != null) {
      publication.toogleBookmark(FirebaseAuth.instance.currentUser!.uid);
    }

    return await _togglePublicationBookmarkFirebase(
        publicationId, publication!.bookmarkedBy);
  }

  @override
  Future<void> togglePublicationLike(String? publicationId) async {
    final publication = await (getPublication(publicationId));
    publication!.toogleLike(FirebaseAuth.instance.currentUser!.uid);

    return await _tooglePublicationLikeFirebase(
        publicationId, publication.likedBy);
  }

  @override
  Future<void> reportComment(String? publicationId, String? commentId) async {
    final comment = await (getComment(publicationId, commentId));
    if (comment!.isReportedBy(FirebaseAuth.instance.currentUser!.uid)) return;
    comment.report(FirebaseAuth.instance.currentUser!.uid);

    return await _reportCommentFirebase(
        publicationId, commentId, comment.reportedBy);
  }

  Future<List<Publication>> _enhancePublications(List<Publication> publications,
      {bool isPoolPulling = false}) async {
    await Future.forEach<Publication>(publications, (publication) async {
      if (!isPoolPulling) {
        // Get comments for all publications
        final comments = await getComments(publication.id);
        final subcomments = await getSubcomments(publication.id);

        publication.comments = comments;
        publication.subcomments = subcomments;
      }

      // Get answers (poll_answers) for all polls
      // Calculate percentages
      if (publication.type == 'POLL') {
        final answers = await getAnswers(publication.id);
        publication.answers = answers;
        publication.refreshPercentages();
      }
    });
    return publications;
  }

  Future<void> _enhanceComment(Comment comment) async {
    final user = await _userRepository.getUserById(comment.userId);
    comment.userName = user?.name ?? '';
    comment.userSpecialistRole = user?.specialistRole ?? '';
  }

  Future<void> _enhanceSubcomment(Subcomment subcomment) async {
    final user = await _userRepository.getUserById(subcomment.comment!.userId);
    subcomment.comment!.userName = user?.name ?? '';
    subcomment.comment!.userSpecialistRole = user?.specialistRole ?? '';
  }

  Future<String> _getStorageUrlFirebase({required String url}) async {
    return await FirebaseStorage.instance.refFromURL(url).getDownloadURL();
  }

  Future<QuerySnapshot<Answer>> _getAnswersFirebase(
      String? publicationId) async {
    return await FirebaseFirestore.instance
        .collection(
            '$COLLECTION_SOCIAL_PUBLICATION/$publicationId/$COLLECTION_ANSWERS')
        .orderBy('order')
        .withConverter<Answer>(
          fromFirestore: (snapshot, _) => Answer.fromJson(snapshot.data()!),
          toFirestore: (answer, _) => answer.toJson(),
        )
        .get();
  }

  Future<DocumentSnapshot<Comment>> _getCommentFirebase(
      String? publicationId, String? commentId) async {
    return await FirebaseFirestore.instance
        .collection(
            '$COLLECTION_SOCIAL_PUBLICATION/$publicationId/$COLLECTION_COMMENTS')
        .doc(commentId)
        .withConverter<Comment>(
          fromFirestore: (snapshot, _) => Comment.fromJson(snapshot.data()!),
          toFirestore: (comment, _) => comment.toJson(),
        )
        .get();
  }

  Future<QuerySnapshot<Comment>> _getCommentsFirebase(
      String? publicationId) async {
    return await FirebaseFirestore.instance
        .collection(
            '$COLLECTION_SOCIAL_PUBLICATION/$publicationId/$COLLECTION_COMMENTS')
        .withConverter<Comment>(
          fromFirestore: (snapshot, _) => Comment.fromJson(snapshot.data()!),
          toFirestore: (comment, _) => comment.toJson(),
        )
        .orderBy('date', descending: true)
        .get();
  }

  Future<DocumentSnapshot<Subcomment>> _getSubcommentFirebase(
      String? publicationId, String? subcommentId) async {
    return await FirebaseFirestore.instance
        .collection(
            '$COLLECTION_SOCIAL_PUBLICATION/$publicationId/$COLLECTION_SUBCOMMENTS')
        .doc(subcommentId)
        .withConverter<Subcomment>(
          fromFirestore: (snapshot, _) => Subcomment.fromJson(snapshot.data()!),
          toFirestore: (subcomment, _) => subcomment.toJson(),
        )
        .get();
  }

  Future<QuerySnapshot<Subcomment>> _getSubcommentsFirebase(
      String? publicationId) async {
    final result = await FirebaseFirestore.instance
        .collection(
            '$COLLECTION_SOCIAL_PUBLICATION/$publicationId/$COLLECTION_SUBCOMMENTS')
        .get();
    print(result);
    return await FirebaseFirestore.instance
        .collection(
            '$COLLECTION_SOCIAL_PUBLICATION/$publicationId/$COLLECTION_SUBCOMMENTS')
        .withConverter<Subcomment>(
          fromFirestore: (snapshot, _) => Subcomment.fromJson(snapshot.data()!),
          toFirestore: (subcomment, _) => subcomment.toJson(),
        )
        //TODO
        //.orderBy('date', descending: true)
        .get();
  }

  Future<DocumentSnapshot<Publication>>? _getPublicationFirebase(String? id) {
    try {
      return FirebaseFirestore.instance
          .collection('$COLLECTION_SOCIAL_PUBLICATION')
          .doc(id)
          .withConverter<Publication>(
            fromFirestore: (snapshot, _) =>
                Publication.fromJson(snapshot.data()!),
            toFirestore: (publication, _) => publication.toJson(),
          )
          .get();
    } catch (e) {
      return null;
    }
  }

  Future<int> _getNumberOfPostsFirebase(
    String? tagId,
  ) {
    return FirebaseFirestore.instance
        .collection('$COLLECTION_SOCIAL_PUBLICATION')
        // .withConverter<Publication>(
        //   fromFirestore: (snapshot, _) =>
        //       Publication.fromJson(snapshot.data()!),
        //   toFirestore: (publication, _) => publication.toJson(),
        // )
        .where('publicationDate', isLessThan: DateTime.now())
        .where('tags', arrayContains: tagId)
        .where('type', isEqualTo: 'POST')
        .snapshots()
        .length;
  }

  Future<QuerySnapshot<Publication>> _getRecommendedPublicationsFirebase(
      {String? tagId}) {
    return FirebaseFirestore.instance
        .collection('$COLLECTION_SOCIAL_PUBLICATION')
        .withConverter<Publication>(
          fromFirestore: (snapshot, _) =>
              Publication.fromJson(snapshot.data()!),
          toFirestore: (publication, _) => publication.toJson(),
        )
        .where('publicationDate', isLessThan: DateTime.now())
        .where('tags', arrayContains: tagId)
        .where('type', isEqualTo: 'POST')
        .orderBy('publicationDate', descending: true)
        .limit(25)
        .get();
  }

  Future<QuerySnapshot<Publication>> _getPublicationsSavedByUserFirebase(
      {required String userId}) {
    return FirebaseFirestore.instance
        .collection('$COLLECTION_SOCIAL_PUBLICATION')
        .withConverter<Publication>(
          fromFirestore: (snapshot, _) =>
              Publication.fromJson(snapshot.data()!),
          toFirestore: (publication, _) => publication.toJson(),
        )
        .where('publicationDate', isLessThan: DateTime.now())
        .where('bookmarkedBy', arrayContains: userId)
        //.where('socialSections', arrayContains: sectionId)
        .orderBy('publicationDate', descending: true)
        .get();
  }

  Future<QuerySnapshot<Publication>> _getPublicationsFirebase(
      lastDoc, String? tagId, String? sectionId) async {
    return lastDoc == null
        ? FirebaseFirestore.instance
            .collection('$COLLECTION_SOCIAL_PUBLICATION')
            .withConverter<Publication>(
              fromFirestore: (snapshot, _) =>
                  Publication.fromJson(snapshot.data()!),
              toFirestore: (publication, _) => publication.toJson(),
            )
            .where('publicationDate', isLessThan: DateTime.now())
            .where('tags', arrayContains: tagId)
            //.where('socialSections', arrayContains: sectionId)
            .orderBy('publicationDate', descending: true)
            .limit(pageSize)
            .get()
        : FirebaseFirestore.instance
            .collection('$COLLECTION_SOCIAL_PUBLICATION')
            .withConverter<Publication>(
              fromFirestore: (snapshot, _) =>
                  Publication.fromJson(snapshot.data()!),
              toFirestore: (publication, _) => publication.toJson(),
            )
            .where('publicationDate', isLessThan: DateTime.now())
            .where('tags', arrayContains: tagId)
            //.where('socialSections', arrayContains: sectionId)
            .orderBy('publicationDate', descending: true)
            .startAfterDocument(lastDoc)
            .limit(pageSize)
            .get();
  }

  Future<QuerySnapshot<Publication>> _getPublicationsByBookmarkFirebase(
      String userId) async {
    return await FirebaseFirestore.instance
        .collection('$COLLECTION_SOCIAL_PUBLICATION')
        .withConverter<Publication>(
          fromFirestore: (snapshot, _) =>
              Publication.fromJson(snapshot.data()!),
          toFirestore: (publication, _) => publication.toJson(),
        )
        .where('bookmarkedBy', arrayContains: userId)
        .orderBy('publicationDate', descending: true)
        .get();
  }

  Future<QuerySnapshot<Selection>> _getSelectionsFirebase(
      String? publicationId, String? answerId) async {
    return await FirebaseFirestore.instance
        .collection(
            '$COLLECTION_SOCIAL_PUBLICATION/$publicationId/$COLLECTION_ANSWERS/$answerId/$COLLECTION_SELECTIONS')
        .withConverter<Selection>(
          fromFirestore: (snapshot, _) => Selection.fromJson(snapshot.data()!),
          toFirestore: (answer, _) => answer.toJson(),
        )
        .get();
  }

  Future<DocumentSnapshot<SocialConfig>> _getSocialConfigFirebase() async {
    return await FirebaseFirestore.instance
        .collection('$COLLECTION_APP_CONFIG')
        .doc('$COLLECTION_SOCIAL_CONFIG')
        .withConverter<SocialConfig>(
          fromFirestore: (snapshot, _) =>
              SocialConfig.fromJson(snapshot.data()!),
          toFirestore: (socialConfig, _) => socialConfig.toJson(),
        )
        .get();
  }

  Future<QuerySnapshot<SocialSection>> _getSocialSectionsFirebase() async {
    return await FirebaseFirestore.instance
        .collection(
            '$COLLECTION_APP_CONFIG/$COLLECTION_APP_SECTION/$COLLECTION_SOCIAL_SECTIONS')
        .withConverter<SocialSection>(
          fromFirestore: (snapshot, _) =>
              SocialSection.fromJson(snapshot.data()!),
          toFirestore: (socialSection, _) => socialSection.toJson(),
        )
        .get();
  }

  Future<QuerySnapshot<Tag>> _getTagsFirebase() async {
    return await FirebaseFirestore.instance
        .collection('$COLLECTION_TAGS')
        .withConverter<Tag>(
          fromFirestore: (snapshot, _) => Tag.fromJson(snapshot.data()!),
          toFirestore: (answer, _) => answer.toJson(),
        )
        .get();
  }

  Future<Subcomment> _setSubcommentFirebase(
      String? publicationId, String? idComment, Comment comment) async {
    final doc = FirebaseFirestore.instance
        .collection(
            '$COLLECTION_SOCIAL_PUBLICATION/$publicationId/$COLLECTION_SUBCOMMENTS')
        .doc();

    final newComment = Comment(
        id: doc.id,
        userId: comment.userId,
        text: comment.text,
        date: comment.date,
        likedBy: comment.likedBy);
    final newSubcomment = Subcomment(
      id: doc.id,
      idComment: idComment,
      comment: newComment,
    );
    await doc.set(
      newSubcomment.toJson(),
      SetOptions(merge: true),
    );

    return newSubcomment;
  }

  Future<Comment> _setCommentFirebase(
      String? publicationId, Comment comment) async {
    final doc = FirebaseFirestore.instance
        .collection(
            '$COLLECTION_SOCIAL_PUBLICATION/$publicationId/$COLLECTION_COMMENTS')
        .doc();

    final newComment = Comment(
        id: doc.id,
        userId: comment.userId,
        text: comment.text,
        date: comment.date,
        likedBy: comment.likedBy);

    await doc.set(
      newComment.toJson(),
      SetOptions(merge: true),
    );

    return newComment;
  }

  Future<Selection> _setSelectionFirebase(
      String? publicationId, String? answerId, Selection selection) async {
    final doc = FirebaseFirestore.instance
        .collection(
            '$COLLECTION_SOCIAL_PUBLICATION/$publicationId/$COLLECTION_ANSWERS/$answerId/$COLLECTION_SELECTIONS')
        .doc();

    final newSelection =
        Selection(id: doc.id, userId: selection.userId, date: selection.date);

    await doc.set(
      newSelection.toJson(),
      SetOptions(merge: true),
    );

    return newSelection;
  }

  Future<void> _toggleCommentLikeFirebase(
      String? publicationId, String? commentId, List<String>? likedBy) async {
    final doc = FirebaseFirestore.instance
        .collection(
            '$COLLECTION_SOCIAL_PUBLICATION/$publicationId/$COLLECTION_COMMENTS')
        .doc(commentId);

    await doc.update({'likedBy': likedBy});
  }

  Future<void> _toggleSubcommentLikeFirebase({
    required String? publicationId,
    required String? subcommentId,
    required Comment comment,
    required List<String>? likedBy,
  }) async {
    final doc = FirebaseFirestore.instance
        .collection(
            '$COLLECTION_SOCIAL_PUBLICATION/$publicationId/$COLLECTION_SUBCOMMENTS')
        .doc(subcommentId);

    await doc.update({
      'comment': {
        'id': doc.id,
        'userId': comment.userId,
        'text': comment.text,
        'date': comment.date,
        'reportedBy': comment.reportedBy,
        'likedBy': likedBy
      },
    });
  }

  Future<void> _tooglePublicationLikeFirebase(
      String? publicationId, List<String>? likedBy) async {
    final doc = FirebaseFirestore.instance
        .collection('$COLLECTION_SOCIAL_PUBLICATION')
        .doc(publicationId);

    await doc.update({'likedBy': likedBy});
  }

  Future<void> _reportCommentFirebase(String? publicationId, String? commentId,
      List<String>? reportedBy) async {
    final doc = FirebaseFirestore.instance
        .collection(
            '$COLLECTION_SOCIAL_PUBLICATION/$publicationId/$COLLECTION_COMMENTS')
        .doc(commentId);

    await doc.update({'reportedBy': reportedBy});
  }

  Future<void> _togglePublicationBookmarkFirebase(
      String? publicationId, List<String>? bookmarkedBy) async {
    final doc = FirebaseFirestore.instance
        .collection('$COLLECTION_SOCIAL_PUBLICATION')
        .doc(publicationId);

    await doc.update({'bookmarkedBy': bookmarkedBy});
  }

  @override
  Future<Publication?> enhancePublication(Publication publication) async {
    List<Publication> enhancedPublication =
        await _enhancePublications([publication]);

    if (enhancedPublication.isNotEmpty) {
      return enhancedPublication.first;
    }
    return null;
  }

  Future<bool> increaseCommentCount(String publicationId) async {
    final doc = FirebaseFirestore.instance
        .collection('$COLLECTION_SOCIAL_PUBLICATION')
        .doc(publicationId);

    DocumentSnapshot snapshot = await doc.get();
    int currentCmsCommentCount = snapshot.get('cmsCommentCount') ?? 0;

    await doc.update({'cmsCommentCount': currentCmsCommentCount + 1});

    return true;
  }
}
