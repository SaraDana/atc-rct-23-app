part of 'in_app_review_cubit.dart';

@freezed
class InAppReviewState with _$InAppReviewState {
  const factory InAppReviewState({
    @Default(0) int displayCount,
    @Default(false) bool isReviewed,
    @Default(false) bool showedThisSession,
  }) = _InAppReviewState;
}
