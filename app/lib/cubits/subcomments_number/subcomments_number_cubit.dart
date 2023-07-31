import 'package:bloc/bloc.dart';

part 'subcomments_number_state.dart';

class SubcommentsNumberCubit extends Cubit<SubcommentsNumberState> {
  SubcommentsNumberCubit() : super(SubcommentsNumberState.initial());

  void increment() {
    final newState = state.copyWith(number: state.number + 5);
    emit(newState);
  }
}
