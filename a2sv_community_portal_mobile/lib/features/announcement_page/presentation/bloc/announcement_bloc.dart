import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'announcement_event.dart';
part 'announcement_state.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  AnnouncementBloc() : super(AnnouncementInitial()) {
    on<AnnouncementEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
