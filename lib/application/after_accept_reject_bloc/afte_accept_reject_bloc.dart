import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:techqrmaintance/domain/afteracceptmodel/afte_accept_services/afte_accept_services.dart';
import 'package:techqrmaintance/domain/afteracceptmodel/after_accept_reject_repo.dart';

part 'afte_accept_reject_event.dart';
part 'afte_accept_reject_state.dart';
part 'afte_accept_reject_bloc.freezed.dart';

@injectable
class AfteAcceptRejectBloc
    extends Bloc<AfteAcceptRejectEvent, AfteAcceptRejectState> {
  final AfterAcceptRejectRepo acceptRejectRepo;
  AfteAcceptRejectBloc(this.acceptRejectRepo)
      : super(AfteAcceptRejectState.initial()) {
    on<Accept>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      await acceptRejectRepo.accept(id: event.servid).then(
            (value) => value.fold(
              (l) => emit(state.copyWith(
                isFailure: true,
                isLoading: false,
              )),
              (r) => emit(state.copyWith(
                isFailure: false,
                isLoading: false,
                service: AfteAcceptServices(),
              )),
            ),
          );
    });

    on<Reject>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      await acceptRejectRepo.reject(id: event.servid).then(
            (value) => value.fold(
              (l) => emit(state.copyWith(
                isFailure: true,
                isLoading: false,
              )),
              (r) => emit(state.copyWith(
                isFailure: false,
                isLoading: false,
                service: AfteAcceptServices(),
              )),
            ),
          );
    });

    on<Reset>(
      (event, emit) {
        emit(AfteAcceptRejectState.initial());
      },
    );
  }
}
