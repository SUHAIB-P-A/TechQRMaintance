part of 'afte_accept_reject_bloc.dart';

@freezed
class AfteAcceptRejectEvent with _$AfteAcceptRejectEvent {
  const factory AfteAcceptRejectEvent.accept({required String servid}) = Accept;
  const factory AfteAcceptRejectEvent.reject({required String servid}) = Reject;
  const factory AfteAcceptRejectEvent.reset() = Reset;
}
