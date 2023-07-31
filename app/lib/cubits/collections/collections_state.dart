import 'package:app/models/collection_model.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'collections_state.freezed.dart';

@freezed
class CollectionsState with _$CollectionsState {
  const factory CollectionsState({
    @Default(StatusCubit.INITIAL) StatusCubit status,
    String? errorMessage,
    List<CollectionModel>? collections,
    String? tagSelected,
  }) = _CollectionsState;
}
