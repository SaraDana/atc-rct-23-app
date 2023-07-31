part of 'collection_tags_list_cubit.dart';

class CollectionTagsListState extends Equatable {
  final List<String> flatList;
  const CollectionTagsListState({required this.flatList});

  @override
  List<Object> get props => [];

  factory CollectionTagsListState.initial() {
    return CollectionTagsListState(flatList: []);
  }

  CollectionTagsListState copyWith({List<String>? flatList}) {
    return CollectionTagsListState(
      flatList: flatList ?? this.flatList,
    );
  }
}
