import 'package:bloc/bloc.dart';

part 'complete_comment_state.dart';

class CompleteCommentCubit extends Cubit<CompleteCommentState> {
  CompleteCommentCubit() : super(CompleteCommentState.initial());

  void showComment() {
    final newState = state.copyWith(showCompleteComment: true);

    emit(newState);
  }

  void notShowComment() {
    final newState = state.copyWith(showCompleteComment: false);

    emit(newState);
  }
}
