part of 'premium_dialog_cubit.dart';

class PremiumDialogState {
  final bool showDialog;
  const PremiumDialogState({required this.showDialog});

  factory PremiumDialogState.initial() {
    return PremiumDialogState(showDialog: true);
  }

  PremiumDialogState copyWith({
    bool? showDialog,
  }) {
    return PremiumDialogState(showDialog: showDialog ?? this.showDialog);
  }
}
