
import 'package:app/core/enums/status_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'interested_event_state.freezed.dart';

@freezed
class InterstedEventState with _$InterstedEventState {
  const factory InterstedEventState({
    @Default(StatusCubit.INITIAL) StatusCubit status,
  }) = _InterstedEventState;
}
