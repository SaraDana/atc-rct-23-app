import 'package:app/config/constants.dart';
import 'package:app/core/enums/store_id.dart';
import 'package:app/core/utils/remote_config/remote_config.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/utils/preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_review/in_app_review.dart';

part 'in_app_review_state.dart';
part 'in_app_review_cubit.freezed.dart';

class InAppReviewCubit extends Cubit<InAppReviewState> {
  DanaRemoteConfig remoteConfig;
  InAppReviewCubit({required this.remoteConfig})
      : super(const InAppReviewState()) {
    emit(state.copyWith(
        displayCount: PreferenceUtils.getNumberOfTimesInAppReviewShown()));
  }

  final InAppReview _inAppReview = InAppReview.instance;

  Future<void> goToStore() async {
    await _inAppReview.openStoreListing(
      appStoreId: StoreID.apple.number,
    );
  }

  Future<void> requestReview() async {
    if (await _inAppReview.isAvailable() && await _showReview()) {
      _inAppReview.requestReview();
      emit(state.copyWith(showedThisSession: true));
      DanaAnalyticsService.trackShowRateUs();
      PreferenceUtils.setInt(
          NUMBER_OF_TIMES_IN_APP_REVIEW_SHOWN, state.displayCount + 1);
    }
  }

  Future<bool> _showReview() async {
    await remoteConfig.init();
    final bool isEnable = remoteConfig.showRateUs;
    return isEnable && state.displayCount < 3 && !state.showedThisSession;
  }
}
