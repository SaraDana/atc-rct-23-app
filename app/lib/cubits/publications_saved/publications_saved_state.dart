import 'package:app/models/publication_model.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'publications_saved_state.freezed.dart';

@freezed
class PublicationsSavedState with _$PublicationsSavedState {
  const factory PublicationsSavedState(
      {@Default(StatusCubit.INITIAL) StatusCubit status,
      String? errorMessage,
      List<Publication>? publications}) = _PublicationsSavedState;
}
