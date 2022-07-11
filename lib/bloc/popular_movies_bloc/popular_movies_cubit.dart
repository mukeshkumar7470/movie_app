import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/movie_repository.dart';
part 'popular_movies_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  PopularMovieCubit({required this.repository})
      : super(const PopularMovieState.loading());

  final MovieRepository repository;

  Future<void> fetchList() async {
    try {
      final movieResponse = await repository.getPopuparMovies(1);
      emit(PopularMovieState.success(movieResponse.movies));
    } on Exception {
      emit(const PopularMovieState.failure());
    }
  }
}