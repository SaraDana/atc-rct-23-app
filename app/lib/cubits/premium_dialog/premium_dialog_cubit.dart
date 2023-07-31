import 'package:flutter_bloc/flutter_bloc.dart';
part 'premium_dialog_state.dart';

class PremiumDialogCubit extends Cubit<PremiumDialogState> {
  PremiumDialogCubit() : super(PremiumDialogState.initial());

  void notShowDialog() {
    final newState = state.copyWith(showDialog: false);
    emit(newState);
  }
}
