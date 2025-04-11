part of 'get_token_bloc.dart';

@freezed
class GetTokenState with _$GetTokenState {
  const factory GetTokenState({
    required String text,
    required bool isLoading,
    required bool isFailure,
  }) = _GetTokenState;
   factory GetTokenState.initial()  {
    return GetTokenState(text: "", isLoading: false, isFailure: false);
  }
}
