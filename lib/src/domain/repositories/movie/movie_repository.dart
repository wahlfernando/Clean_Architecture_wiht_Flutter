import 'package:arquitetura_flutter_clean/src/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/movie_listings/movie_listings_entity.dart';

import '../../../core/exceptions/database/database_exception.dart';
import '../../../core/exceptions/network/network_exceptions.dart';

abstract class MovieRepository {
  Future<Either<NetworkException, MovieListingsEntity>> getTopRateMovies({required int page});
  Future<Either<NetworkException, MovieListingsEntity>> getPopularMovies({required int page});
  Future<Either<NetworkException, MovieListingsEntity>> getMoviesCredit({required int movieId});
  Future<Either<DatabaseException, List<MovieDetailEntity>>> getSaveMovieDetails();
  Future<Either<DatabaseException, void>> saveMovieDetails({required MovieDetailEntity? movieDetailEntity});
  Future<Either<DatabaseException, void>> deleteMovieDetail({required int? movieId});
  Future<Either<DatabaseException, bool>> isSavedMovieDetail({required int? movieId});
}