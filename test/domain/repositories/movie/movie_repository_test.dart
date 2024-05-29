import 'package:arquitetura_flutter_clean/src/core/exceptions/network/network_exceptions.dart';
import 'package:arquitetura_flutter_clean/src/data/datasource/local/actor/movie_local_data_source.dart';
import 'package:arquitetura_flutter_clean/src/data/datasource/remote/movie/movie_remote_data_source.dart';
import 'package:arquitetura_flutter_clean/src/data/models/movie_credit/cast_model.dart';
import 'package:arquitetura_flutter_clean/src/data/models/movie_credit/crew_model.dart';
import 'package:arquitetura_flutter_clean/src/data/models/movie_credit/movie_credit_model.dart';
import 'package:arquitetura_flutter_clean/src/data/models/movie_detail/movie_detail.dart';
import 'package:arquitetura_flutter_clean/src/data/models/movie_listings/movie_listings_model.dart';
import 'package:arquitetura_flutter_clean/src/data/repositories/movie/movie_repository_impl.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/movie_credit/cast_entity.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/movie_credit/crew_entity.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/movie_credit/movie_credit_entity.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/movie_listings/movie_listings_entity.dart';
import 'package:arquitetura_flutter_clean/src/domain/repositories/movie/movie_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final MovieRepository movieRepository;
  late final MovieRemoteDataSource mockMovieRemoteDataSource;
  late final MovieLocalDataSource mockMovieLocalDataSource;

  late final MovieListingsModel tMovieListingsModel;
  late final MovieCreditModel tMovieCreditModel;
  late final MovieDetailModel tMovieDetailModel;

  late final MovieListingsEntity tMovieListingsEntity;
  late final MovieCreditEntity tMovieCreditEntity;
  late final MovieDetailEntity tMovieDetailEntity;

  setUpAll(() {
    mockMovieRemoteDataSource = MockMovieRemoteDataSource();
    mockMovieLocalDataSource = MockMovieLocalDataSource();
    movieRepository = MovieRepositoryImpl(
        mockMovieRemoteDataSource, mockMovieLocalDataSource);

    tMovieDetailModel = const MovieDetailModel(
      id: 1,
      title: 'title',
      overview: 'overview',
      posterPath: 'posterPath',
      backdropPath: 'backdropPath',
      voteAverage: 1,
      releaseDate: 'releaseDate',
    );

    tMovieDetailEntity = const MovieDetailEntity(
      id: 1,
      title: 'title',
      overview: 'overview',
      posterPath: 'posterPath',
      backdropPath: 'backdropPath',
      voteAverage: 1,
      releaseDate: 'releaseDate',
    );

    tMovieListingsModel = MovieListingsModel(
      page: 1,
      movies: [tMovieDetailModel, tMovieDetailModel],
      total_pages: 1,
      total_results: 1,
    );

    tMovieListingsEntity = MovieListingsEntity(
      page: 1,
      totalPages: 1,
      movies: [tMovieDetailEntity, tMovieDetailEntity],
      totalResults: 1
    );

    tMovieCreditModel = const MovieCreditModel(
      id: 1,
      cast: [
        CastModel(
            id: 1,
            name: 'name',
            character: 'character',
            profilePath: 'profilePath')
      ],
      crew: [CrewModel(id: 1, name: 'name', profilePath: 'profilePath')],
    );

    tMovieCreditEntity = const MovieCreditEntity(
      id: 1,
      cast: [
        CastEntity(
            id: 1,
            name: 'name',
            character: 'character',
            profilePath: 'profilePath')
      ],
      crew: [CrewEntity(id: 1, name: 'name', profilePath: 'profilePath')],
    );
  });

  group('getPopularMovies', () {
    const tPage = 1;
    final dioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        statusMessage: 'Not Found',
      ),
    );

    test(
        'should return [MovieListingsEntity] when the call to remote data source is successful',
        () async {
      when(mockMovieRemoteDataSource.getPopularMovies(page: tPage))
          .thenAnswer((_) async => tMovieListingsModel);
      final result = await movieRepository.getPopularMovies(page: tPage);
      expect(result, equals(Right(tMovieListingsEntity)));
      verify(mockMovieRemoteDataSource.getPopularMovies(page: tPage));
      verifyNoMoreInteractions(mockMovieRemoteDataSource);
    });

    test(
        'should return [NetworkException] when the call to remote data source is unsuccessful',
        () async {
      when(mockMovieRemoteDataSource.getPopularMovies(page: tPage))
          .thenThrow(dioException);
      final result = await movieRepository.getPopularMovies(page: tPage);
      expect(result, equals(Left(NetworkException.fromDioError(dioException))));
      verify(mockMovieRemoteDataSource.getPopularMovies(page: tPage));
      verifyNoMoreInteractions(mockMovieRemoteDataSource);
    });
  });

  group('getTopRatedMovies', () {
    const tPage = 1;
    final dioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        statusMessage: 'Not Found',
      ),
    );

    test(
        'should return [MovieListingsEntity] when the call to remote data source is successful',
        () async {
      when(mockMovieRemoteDataSource.getTopRateMovies(page: tPage))
          .thenAnswer((_) async => tMovieListingsModel);
      final result = await movieRepository.getTopRateMovies(page: tPage);
      expect(result, equals(Right(tMovieListingsEntity)));
      verify(mockMovieRemoteDataSource.getTopRateMovies(page: tPage));
      verifyNoMoreInteractions(mockMovieRemoteDataSource);
    });

    test(
        'should return [NetworkException] when the call to remote data source is unsuccessful',
        () async {
      when(mockMovieRemoteDataSource.getTopRateMovies(page: tPage))
          .thenThrow(dioException);
      final result = await movieRepository.getTopRateMovies(page: tPage);
      expect(result, equals(Left(NetworkException.fromDioError(dioException))));
      verify(mockMovieRemoteDataSource.getTopRateMovies(page: tPage));
      verifyNoMoreInteractions(mockMovieRemoteDataSource);
    });
  });

  group('getMovieCredits', () {
    const tMovieId = 1;
    final dioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        statusMessage: 'Not Found',
      ),
    );

  });

}
