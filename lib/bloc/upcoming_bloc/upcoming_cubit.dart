import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/movie_repository.dart';
part 'upcoming_state.dart';

class UpComingCubit extends Cubit<UpComingState> {
  UpComingCubit({required this.repository})
      : super(const UpComingState.loading());

  final MovieRepository repository;

  Future<void> fetchUpComing() async {
    try {
      final movieResponse = await repository.getUpcomingMovies();
      emit(UpComingState.success(movieResponse.movies));
    } on Exception {
      emit(const UpComingState.failure());
    }
  }
}
