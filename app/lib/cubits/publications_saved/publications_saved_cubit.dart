//IMPORT EXTERN APP
import 'package:app/core/enums/status_cubit.dart';
import 'package:bloc/bloc.dart';

//IMPORT INTERN APP
import 'package:app/models/publication_model.dart';
import 'package:app/cubits/publications_saved/publications_saved_state.dart';
import 'package:app/data/repositories/publication/firebase_publication_repository.dart';

class PublicationsSavedCubit extends Cubit<PublicationsSavedState> {
  final String userId;
  PublicationsSavedCubit({required this.userId})
      : super(PublicationsSavedState()) {
    _getPublicationsSavedByUser(userId: userId);
  }

  Future<void> _getPublicationsSavedByUser({required String userId}) async {
    emit(state.copyWith(
      status: StatusCubit.LOADING,
    ));

    try {
      final List<Publication> publications =
          await FirebasePublicationRepository()
              .getPublicationsSavedByUser(userId: userId);
      emit(state.copyWith(
        status: StatusCubit.SUCCESS,
        publications: publications,
      ));
    } catch (e) {
      emit(state.copyWith(
          status: StatusCubit.ERROR,
          errorMessage: 'Error en la carga de datos'));
    }
  }
}
