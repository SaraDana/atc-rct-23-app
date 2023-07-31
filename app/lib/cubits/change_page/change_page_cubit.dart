import 'package:app/data/services/dana_analytics_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_page_state.dart';

class ChangePageCubit extends Cubit<ChangePageState> {
  ChangePageCubit() : super(ChangePageState.initial()) {
    _sendAnalytics(state.index);
  }

  void changeIndexPage({required int index}) {
    _sendAnalytics(index);
    emit(state.copyWith(index: index));
  }

  _sendAnalytics(int index) {
    DanaAnalyticsService.trackMainSectionSelected(
        _analyticsPageNameForIndex(index));
    DanaAnalyticsService.trackVisitPage(_analyticsPageNameForIndex(index));
  }

  _analyticsPageNameForIndex(int index) {
    if (index == 0) return 'new_home_page';
    if (index == 1) return 'program_page';
    if (index == 2) return 'social_page_filter';
    if (index == 3) return 'tracking_page';
    return '';
  }
}
