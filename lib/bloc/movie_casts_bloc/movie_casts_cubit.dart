import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/models/cast.dart';
import 'package:movie_app/services/movie_repository.dart';
part 'movie_casts_state.dart';

class MovieCastsCubit extends Cubit<MovieCastsState> {
  MovieCastsCubit({required this.repository})
      : super(const MovieCastsState.loading());

  final MovieRepository repository;

  Future<void> fetchCasts(int movieId) async {
    try {
      final movieResponse = await repository.getCasts(movieId);
      emit(MovieCastsState.success(movieResponse.casts));
    } on Exception {
      emit(const MovieCastsState.failure());
    }
  }
}