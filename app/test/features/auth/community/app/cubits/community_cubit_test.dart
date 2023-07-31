import 'package:app/data/repositories/publication/publication_repository.dart';
import 'package:app/features/community/app/cubits/community_cubit.dart';
import 'package:app/models/social_config_model.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPublicationRepository extends Mock implements PublicationRepository {}

void main() {
  late PublicationRepository mockPublicationRepository;
  late CommunityCubit communityCubit;

  setUp(() {
    mockPublicationRepository = MockPublicationRepository();
    communityCubit = CommunityCubit(repository: mockPublicationRepository);
    // change when to future


    when(() => mockPublicationRepository.getSocialConfig())
        .thenAnswer((_) async => SocialConfig());
  });

  group('CommunityCubit', () {
    blocTest<CommunityCubit, CommunityState>(
      'emits [state.copyWith(socialConfig: socialConfig, filters: socialConfig.filters)] when init is called',
      build: () {
        return communityCubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        const CommunityState().copyWith(socialConfig: SocialConfig(),),
      ],
    );
    blocTest<CommunityCubit, CommunityState>(
      'emits [state.copyWith(tagSelected: tagId)] when selectTag is called',
      build: () => communityCubit,
      act: (cubit) => cubit.selectTag('example_tag_id'),
      expect: () => [
        const CommunityState().copyWith(tagSelected: 'example_tag_id'),
      ],
    );


  });
}
