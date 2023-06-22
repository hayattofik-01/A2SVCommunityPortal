import 'package:a2sv_community_portal_mobile/features/contest/domain/entities/contest.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/usecases/get_upcoming_contests.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'upcoming_contests_event.dart';
part 'upcoming_contests_state.dart';

class UpcomingContestsBloc
    extends Bloc<UpcomingContestsEvent, UpcomingContestsState> {
  GetUpcomingContests getUpcomingContests;
  UpcomingContestsBloc({required this.getUpcomingContests})
      : super(UpcomingContestsInitial()) {
    on<UpcomingContestsEvent>((event, emit) async {
      if (event is FetchUpcomingContestsEvent) {
        emit(UpcomingContestsLoading());

        final response = await getUpcomingContests();
        response.fold(
          (error) => emit(UpcomingContestsError(message: error.toString())),
          (upcomingContests) =>
              emit(UpcomingContestsLoaded(upcomingContests: upcomingContests)),
        );
      }
    });
  }
}
