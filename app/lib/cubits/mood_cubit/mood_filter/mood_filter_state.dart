import 'package:app/core/enums/grapich_type_enum.dart';
import 'package:app/models/user_mood_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mood_filter_state.freezed.dart';

@freezed
class MoodFilterState with _$MoodFilterState {
  const factory MoodFilterState({
    FilterUserMood? filterUserMood,
    GrapichType? graphichType,
  }) = _MoodFilterState;
}
