import 'package:a2sv_community_portal_mobile/features/home/domain/usecases/application_step_usecase.dart';
import 'package:a2sv_community_portal_mobile/features/home/presentation/bloc/cubit/home_cubit_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApplicationStepUseCases applicationStepUseCases;

  HomeBloc({required this.applicationStepUseCases}) : super(HomeInitial());

    void _fetchdData(
    GetArticleByIdEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final result = await getArticleById(event.articleId);
    emit(articleSuccessOrFailure(result));
  }

  void _deleteArticle(
      DeleteArticleEvent event, Emitter<HomeState> emit) async {
    emit(ArticleLoadingState());
    final result = await deleteArticle(event.articleId);
    emit(articleSuccessOrFailure(result));
  }

HomeBloc({
    required this.ApplicationStepUseCases,
  }) : super(HomeInitial()) {
    on<GetArticleByIdEvent>(_getArticleById);

  }
}