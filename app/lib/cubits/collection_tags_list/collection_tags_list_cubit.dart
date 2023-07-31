import 'package:app/data/repositories/program/firebase_program_repository.dart';

import 'package:app/models/collection_model.dart';
import 'package:app/models/program_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'collection_tags_list_state.dart';

class CollectionTagsListCubit extends Cubit<CollectionTagsListState> {
  final CollectionModel collection;
  CollectionTagsListCubit({required this.collection})
      : super(CollectionTagsListState.initial()) {
    initAnyProgramTagList(collection);
  }

  void initAnyProgramTagList(CollectionModel collection) async {
    List<String> flatList = [];
    List<Program> programList = [];
    if (collection.programsIds != null) {
      for (var i = 0; i < collection.programsIds!.length; i++) {
        try {
          Program? p = await FirebaseProgramRepository()
              .getProgramById(collection.programsIds![i]);
          programList.add(p!);
        } catch (e) {}
      }
      var t = programList.map((e) => e.tagsRefs!.map((t) => t.id));

      flatList = t.expand((element) => element).toList();
    }

    final newState = state.copyWith(flatList: flatList);
    emit(newState);
  }
}
