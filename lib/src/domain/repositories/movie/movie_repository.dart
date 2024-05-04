import 'package:arquitetura_flutter_clean/src/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/movie_listings/movie_listings_entity.dart';

abstract class MovieRepository {
  Future<Either<NetworkException, MovieListingsEntity>> getTopRateMovies({required int page});
  Future<Either<NetworkException, MovieListingsEntity>> getPopularMovies({required int page});
  Future<Either<NetworkException, MovieListingsEntity>> getMoviesCredit({required int movieId});
  Future<Either<NetworkException, MovieListingsEntity>> getSaveMovieDetails();
  Future<Either<NetworkException, MovieListingsEntity>> saveMovieDetails({required MovieDetailEntity movieDetailEntity});
  Future<Either<NetworkException, MovieListingsEntity>> deleteMovieDetail({required int movieId});
  Future<Either<NetworkException, MovieListingsEntity>> isSavedMovieDetails({required int movieId});
}