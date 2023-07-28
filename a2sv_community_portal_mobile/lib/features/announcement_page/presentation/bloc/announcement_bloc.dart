import 'package:a2sv_community_portal_mobile/core/usecases/usecase.dart';
import 'package:a2sv_community_portal_mobile/features/announcement_page/domain/usecase/get_announcement.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/announcement.dart';

part 'announcement_event.dart';
part 'announcement_state.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  GetAnnouncements getAnnouncements;
  AnnouncementBloc({required this.getAnnouncements})
      : super(AnnouncementInitial()) {
    on<AnnouncementEvent>((event, emit) async {
      if (event is GetAnnouncementEvent) {
        emit(AnnouncementLoading());
        final response = await getAnnouncements(NoParams());
        response.fold(
          (error) => emit(AnnouncementError(message: error.toString())),
          (announcement) =>
              emit(AnnouncementLoaded(announcements: announcement)),
        );
      }
    });
  }
}
