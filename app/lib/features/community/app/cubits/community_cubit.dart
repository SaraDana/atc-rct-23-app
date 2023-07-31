import 'package:app/data/repositories/publication/publication_repository.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/models/social_config_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_state.dart';
part 'community_cubit.freezed.dart';

class CommunityCubit extends Cubit<CommunityState> {
  PublicationRepository repository;
  CommunityCubit({required this.repository}) : super(const CommunityState());

  void init() async {
    final SocialConfig _socialConfig = await repository.getSocialConfig();
    emit(state.copyWith(
      socialConfig: _socialConfig,
      filters: _socialConfig.filters ?? [],
    ));
  }

  void selectTag(String? tagId) {
      emit(state.copyWith(tagSelected: tagId));
      if(tagId != null) {
        DanaAnalyticsService.trackSocialPageTag(tagId);
      }

    }
}
