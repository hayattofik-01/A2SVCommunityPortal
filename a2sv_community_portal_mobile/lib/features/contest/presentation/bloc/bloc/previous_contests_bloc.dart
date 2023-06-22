import 'package:a2sv_community_portal_mobile/features/contest/domain/entities/contest.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/usecases/get_past_contests.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'previous_contests_event.dart';
part 'previous_contests_state.dart';

class PreviousContestsBloc
    extends Bloc<PreviousContestsEvent, PreviousContestsState> {
  GetPastContests getPreviousContests;

  PreviousContestsBloc({required this.getPreviousContests})
      : super(PreviousContestsInitial()) {
    on<PreviousContestsEvent>((event, emit) async {
      if (event is FetchPreviousContests) {
        emit(PreviousContestsLoading());

        final response = await getPreviousContests();
        response.fold(
          (error) => emit(PreviousContestsError(message: error.toString())),
          (previousContests) =>
              emit(PreviousContestsLoaded(previousContests: previousContests)),
        );
      }
    });
  }
}
