import 'package:arquitetura_flutter_clean/src/core/exceptions/network/network_exceptions.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/movie_listings/movie_listings_entity.dart';
import 'package:arquitetura_flutter_clean/src/domain/repositories/movie/movie_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/exceptions/database/database_exception.dart';

class MovieUsecases {
  final MovieRepository _movieRepository;

  MovieUsecases(
    this._movieRepository,
  );

  Future<Either<NetworkException, MovieListingsEntity>> getPopularMovies(
      {required int page}) async {
    return _movieRepository.getPopularMovies(page: page);
  }

  Future<Either<NetworkException, MovieListingsEntity>> getTopRatesMovie(
      {required int page}) async {
    return _movieRepository.getTopRateMovies(page: page);
  }

  Future<Either<NetworkException, MovieListingsEntity>> getMovieCredits(
      {required int moveId}) async {
    return _movieRepository.getMoviesCredit(movieId: moveId);
  }

  Future<Either<DatabaseException, List<MovieDetailEntity>>>
      getSaveMovieDetails() async {
    return _movieRepository.getSaveMovieDetails();
  }

  Future<Either<DatabaseException, void>> toggleBookmark(
      {required MovieDetailEntity? movieDetailEntity}) async {
    final isSaved = await _movieRepository.isSavedMovieDetail(
        movieId: movieDetailEntity?.id);

    return isSaved.fold((error) {
      return Left(error);
    }, 
    (isSaved) {
      if (isSaved) {
        return _movieRepository.deleteMovieDetail(
            movieId: movieDetailEntity?.id);
      } else{
        return _movieRepository.saveMovieDetails(movieDetailEntity: movieDetailEntity);
      }
    });
  }
}
