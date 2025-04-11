part of 'get_token_bloc.dart';

@freezed
class GetTokenEvent with _$GetTokenEvent {
  const factory GetTokenEvent.getTokenevent({
    required String email,
    required String password,
  }) = GetTokenevent;
}