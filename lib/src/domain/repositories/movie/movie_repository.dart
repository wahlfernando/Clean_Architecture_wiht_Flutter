import 'package:arquitetura_flutter_clean/src/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/movie_listings/movie_listings_entity.dart';

import '../../../core/exceptions/network/network_exceptions.dart';

abstract class MovieRepository {
  Future<Either<NetworkExceptions, MovieListingsEntity>> getTopRateMovies({required int page});
  Future<Either<NetworkExceptions, MovieListingsEntity>> getPopularMovies({required int page});
  Future<Either<NetworkExceptions, MovieListingsEntity>> getMoviesCredit({required int movieId});
  Future<Either<NetworkExceptions, MovieListingsEntity>> getSaveMovieDetails();
  Future<Either<NetworkExceptions, MovieListingsEntity>> saveMovieDetails({required MovieDetailEntity movieDetailEntity});
  Future<Either<NetworkExceptions, MovieListingsEntity>> deleteMovieDetail({required int movieId});
  Future<Either<NetworkExceptions, MovieListingsEntity>> isSavedMovieDetails({required int movieId});
}