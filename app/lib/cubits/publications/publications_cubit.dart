//IMPORT EXTERN APP
import 'package:app/core/enums/status_cubit.dart';
//IMPORT INTERN APP
import 'package:app/cubits/publications/publications_state.dart';
import 'package:app/data/repositories/publication/firebase_publication_repository.dart';
import 'package:app/models/publication_model.dart';
import 'package:bloc/bloc.dart';

class PublicationsCubit extends Cubit<PublicationsState> {
  PublicationsCubit() : super(PublicationsState());

  Future<void> getPublication({required String? id}) async {
    emit(state.copyWith(
      status: StatusCubit.LOADING,
    ));
    try {
      final Publication? publication =
          await FirebasePublicationRepository().getPublication(id);

      emit(state.copyWith(
        publication: publication,
        status: StatusCubit.SUCCESS,
      ));
    } catch (e) {
      emit(
        state.copyWith(
          status: StatusCubit.ERROR,
          publication: null,
          errorMessage: 'Error en la carga de datos',
        ),
      );
    }
  }

  Future<void> getPublications(String? tagId, String? sectionId,
      [useLastDoc = true]) async {
    if (!useLastDoc)
      emit(state.copyWith(
        status: StatusCubit.LOADING,
      ));
    else
      emit(state.copyWith(
        status: StatusCubit.LOADING_MORE,
      ));
    try {
      final List<Publication> publications =
          await FirebasePublicationRepository()
              .getPublications(tagId, sectionId, useLastDoc);

      emit(state.copyWith(
        status: StatusCubit.SUCCESS,
        publications: publications,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: StatusCubit.ERROR,
        errorMessage: 'Error en la carga de datos',
      ));
    }
  }

  Future<Publication?> enhancePublication(Publication? publication) async {
    try {
      if(publication == null) return null;
      return await FirebasePublicationRepository()
          .enhancePublication(publication);
    } catch (e) {
      print("There is a problem in PublicationsCubit / enhancePublication $e");
    }
    return null;
  }
}
