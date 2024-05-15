
import 'package:arquitetura_flutter_clean/src/core/exceptions/database/database_exception.dart';
import 'package:arquitetura_flutter_clean/src/core/exceptions/network/network_exceptions.dart';
import 'package:arquitetura_flutter_clean/src/data/datasource/local/actor/movie_local_data_source.dart';
import 'package:arquitetura_flutter_clean/src/data/datasource/local/collections/movie_detail_collection.dart';
import 'package:arquitetura_flutter_clean/src/data/datasource/remote/movie/movie_remote_data_source.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/movie_listings/movie_listings_entity.dart';
import 'package:arquitetura_flutter_clean/src/domain/repositories/movie/movie_repository.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:isar/isar.dart';

class MovieRepositoryImpl implements MovieRepository{
  final MovieRemoteDataSource _movieRemoteDataSource;
  final MovieLocalDataSource _movieLocalDataSource;

  MovieRepositoryImpl(this._movieRemoteDataSource, this._movieLocalDataSource);

  //REMOTE 
  @override
  Future<Either<NetworkException, MovieListingsEntity>> getPopularMovies({required int page}) async{
    try {
      final result = await _movieRemoteDataSource.getPopularMovies(page: page);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }
  
  @override
  Future<Either<NetworkException, MovieListingsEntity>> getTopRateMovies({required int page}) async {
    try {
      final result = await _movieRemoteDataSource.getTopRateMovies(page: page);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  //LOCAL  
  @override
  Future<Either<DatabaseException, List<MovieDetailEntity>>> getSaveMovieDetails() async{
    try {
      final result = await _movieLocalDataSource.getSaveMovieDetail();
      return Right(result.map((e) => e.toEntity()).toList());
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, void>> saveMovieDetails({required MovieDetailEntity? movieDetailEntity}) async{
    try {
      final result = await _movieLocalDataSource.saveMovieDetail(movieDetailCollection: MovieDetailCollection().frontEntity(movieDetailEntity!));
      return Right(result);
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }
  
  @override
  Future<Either<DatabaseException, void>> deleteMovieDetail({required int? movieId}) async{
    try {
      final result = await _movieLocalDataSource.deleteMovieDetail(movieId: movieId);
      return Right(result);
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }
  @override
  Future<Either<NetworkException, MovieListingsEntity>> getMoviesCredit({required int movieId}) {
    throw UnimplementedError();
  }



  @override
  Future<Either<DatabaseException, bool>> isSavedMovieDetail({required int? movieId}) async {
    try {
      final result = await _movieLocalDataSource.isSaveMovieDetail(movieId: movieId);
      return Right(result);
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  
}