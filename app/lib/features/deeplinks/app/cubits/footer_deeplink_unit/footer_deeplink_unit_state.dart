import 'package:app/core/enums/status_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'footer_deeplink_unit_state.freezed.dart';

@freezed
class FooterDeeplinkUnitState with _$FooterDeeplinkUnitState {
  const factory FooterDeeplinkUnitState({
    @Default(StatusCubit.INITIAL) StatusCubit status,
    String? errorMessage,
    String? deeplinkUrl,
    bool? useful,
  }) = _FooterDeeplinkUnitState;
}
