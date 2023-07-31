import '../models/collection_model.dart';
import '../models/program_model.dart';

CollectionModel mapProgramToCollection(Program program) {
  return CollectionModel(
    id: program.id,
    title: program.title,
    subtitle: program.subtitle,
    isPremium: program.isPremium,
    programsRefs: program.unitsRefs,
    programsPaths: [program.reference!.path],
  );
}
