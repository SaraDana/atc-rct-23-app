import 'package:app/models/publication_model.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'publications_state.freezed.dart';

@freezed
class PublicationsState with _$PublicationsState {
  const factory PublicationsState({
    @Default(StatusCubit.INITIAL) StatusCubit status,
    String? errorMessage,
    Publication? publication,
    List<Publication>? publications,
  }) = _PublicationsState;
}
