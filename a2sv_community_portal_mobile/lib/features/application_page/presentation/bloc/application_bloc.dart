import 'package:a2sv_community_portal_mobile/core/usecases/usecase.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/domain/entities/application_step_entity.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/domain/usecases/application_step_usecase.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final GetSteps getStep;

  void _fetchData(FetchDataEvent event, Emitter<ApplicationState> emit) async {
    emit(ApplicationLoading());
    final result = await getStep(NoParams());

    result.fold(
        (failure) => emit(const ApplicationError(message: unknown)),
        (applicationStepEntity) => emit(
            ApplicationLoaded(applicationStepEntity: applicationStepEntity)));
  }

  ApplicationBloc({required this.getStep})
      : super(const ApplicationInitial(message: "initial")) {
    on<FetchDataEvent>(_fetchData);
  }
}
