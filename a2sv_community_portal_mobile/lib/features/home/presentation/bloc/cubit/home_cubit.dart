import 'package:a2sv_community_portal_mobile/features/home/domain/usecases/application_step_usecase.dart';
import 'package:a2sv_community_portal_mobile/features/home/presentation/bloc/cubit/home_cubit_state.dart';
import 'package:bloc/bloc.dart';




class HomeCubit extends Cubit<HomeState> {
  final ApplicationStepUseCases applicationStepUseCases;

  HomeCubit({required this.applicationStepUseCases}) : super(HomeInitial());

  void fetchData() async {
    emit(HomeLoading());
    final result = await applicationStepUseCases.getSteps();
    result.fold(
      (failure) => emit(HomeError()),
      (data) => emit(HomeLoaded(data)),
    );
  }

  void nextStep() {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      if (currentState.currentStepIndex < currentState.applicationStep.subSteps.length - 1) {
        emit(currentState.copyWith(currentStepIndex: currentState.currentStepIndex + 1));
      }
    }
  }

  void previousStep() {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      if (currentState.currentStepIndex > 0) {
        emit(currentState.copyWith(currentStepIndex: currentState.currentStepIndex - 1));
      }
    }
  }
}