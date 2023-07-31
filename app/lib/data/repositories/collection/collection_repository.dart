//IMPORT INTERN APP
import 'package:app/models/collection_model.dart';

abstract class CollectionRepository {
  Future<List<CollectionModel>> getAllCollections();
}
