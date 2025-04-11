part of 'afte_accept_reject_bloc.dart';

@freezed
class AfteAcceptRejectState with _$AfteAcceptRejectState {
  const factory AfteAcceptRejectState({
    required AfteAcceptServices service,
    required bool isLoading,
    required bool isFailure,
  }) = _AfteAcceptRejectState;

  factory AfteAcceptRejectState.initial() {
    return AfteAcceptRejectState(
      service: AfteAcceptServices(),
      isLoading: false,
      isFailure: false,
    );
  }
}
