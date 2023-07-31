//IMPORT EXTERN APP
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/features/deeplinks/domain/enums/deep_link_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

//IMPORT INTERN APP
part 'deeplink_state.freezed.dart';

@freezed
class DeeplinkState with _$DeeplinkState {
  const factory DeeplinkState({
    @Default(StatusCubit.INITIAL) StatusCubit status,
    @Default(DeepLinkType.INITIAL) DeepLinkType deepLinkType,
    @Default(false) bool forceNavigate,
    String? errorMessage,
    String? deeplink,
    Uri? deeplinkInQueue,
    Uri? url,
  }) = _DeeplinkState;
}
