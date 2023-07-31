import 'dart:developer';

import 'package:app/models/comment_model.dart';
import 'package:bloc/bloc.dart';

part 'change_comment_state.dart';

class ChangeCommentCubit extends Cubit<ChangeCommentState> {
  ChangeCommentCubit() : super(ChangeCommentState.initial());

  void answerComment({required Comment selectComment}) {
    final newState = state.copyWith(comment: selectComment);
    log('${newState.comment.userName}');
    emit(newState);
  }
}
