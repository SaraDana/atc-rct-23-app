import 'package:bloc/bloc.dart';

part 'comments_number_state.dart';

class CommentsNumberCubit extends Cubit<CommentsNumberState> {
  CommentsNumberCubit() : super(CommentsNumberState.initial());

  void increment() {
    final newState = state.copyWith(number: state.number + 4);
    emit(newState);
  }
}
