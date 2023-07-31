import 'package:app/cubits/collections/collections_state.dart';
import 'package:app/models/collection_model.dart';
import 'package:app/data/repositories/collection/firebase_collection_repository.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:bloc/bloc.dart';

class CollectionsCubit extends Cubit<CollectionsState> {
  CollectionsCubit() : super(CollectionsState()) {
    _getCollections();
  }

  Future<void> _getCollections() async {
    emit(state.copyWith(
      status: StatusCubit.LOADING,
    ));
    try {
      final List<CollectionModel> collections =
          await FirebaseCollectionRepository().getAllCollections();

      emit(state.copyWith(
        collections: collections,
        status: StatusCubit.SUCCESS,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: StatusCubit.ERROR,
        errorMessage: 'Error en la carga de datos',
      ));
    }
  }

  changeTagId({required String tagId}) {
    if (state.tagSelected == tagId) {
      emit(state.copyWith(
        tagSelected: null,
      ));
    } else {
      emit(state.copyWith(
        tagSelected: tagId,
      ));
    }
  }
}
