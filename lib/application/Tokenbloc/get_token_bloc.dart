import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techqrmaintance/domain/token/get_user_token_repo.dart';

part 'get_token_event.dart';
part 'get_token_state.dart';
part 'get_token_bloc.freezed.dart';

class GetTokenBloc extends Bloc<GetTokenEvent, GetTokenState> {
  final GetTokenRepo getTokenRepo;
  GetTokenBloc(this.getTokenRepo) : super(GetTokenState.initial()) {
    on<GetTokenevent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      await getTokenRepo
          .getToken(email: event.email, password: event.password)
          .then(
            (value) => value.fold(
              (l) => emit(state.copyWith(
                isFailure: true,
                isLoading: false,
              )),
              (r) => emit(state.copyWith(
                text: r,
                isFailure: false,
                isLoading: false,
              )),
            ),
          );
    });
  }
}
