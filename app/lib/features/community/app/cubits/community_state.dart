part of 'community_cubit.dart';

@freezed
class CommunityState with _$CommunityState {
  const factory CommunityState({
    @Default([]) List<Filter> filters,
    String? tagSelected,
    SocialConfig? socialConfig,
  }) = _Initial;
}
