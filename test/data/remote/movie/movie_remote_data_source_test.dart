import 'package:arquitetura_flutter_clean/src/core/constants/url_constants.dart';
import 'package:arquitetura_flutter_clean/src/core/network/dio_client.dart';
import 'package:arquitetura_flutter_clean/src/data/datasource/remote/movie/movie_remote_data_source_impl.dart';
import 'package:arquitetura_flutter_clean/src/data/models/movie_credit/movie_credit_model.dart';
import 'package:arquitetura_flutter_clean/src/data/models/movie_listings/movie_listings_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../_utils/json_reader.dart';
import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late DioClient mockDioClient;
  late final MovieRemoteDataSourceImpl actorRemoteDataSource;

  late final MovieListingsModel tMovieListingsModel;
  late final MovieCreditModel tMovieCreditModel;

  late final dynamic movieListingsJson;
  late final dynamic movieCreditJson;

  setUpAll(() {
    mockDioClient = MockDioClient();
    actorRemoteDataSource = MovieRemoteDataSourceImpl(mockDioClient);

    movieListingsJson = jsonReader('movie_listings_dummy_data.json');
    movieCreditJson = jsonReader('movie_credit_dummy_data.json');

    tMovieListingsModel =
        MovieListingsModel.fromJson(movieListingsJson as Map<String, dynamic>);
    tMovieCreditModel =
        MovieCreditModel.fromJson(movieCreditJson as Map<String, dynamic>);
  });

  group('getPopularMovies', () {
    const int page = 1;

    late final Response<dynamic> response;

    setUpAll(() {
      response = Response<dynamic>(
        data: movieListingsJson,
        requestOptions: RequestOptions(
          path: UrlConstants.popularMovies,
          queryParameters: {'page': page},
        ),
      );
    });

    test('should return a [MovieListingsModel()] when the call is successful',
        () async {
      when(mockDioClient.get(UrlConstants.popularMovies,
          queryParameters: {'page': page})).thenAnswer(
        (_) async => response,
      );

      final result = await actorRemoteDataSource.getPopularMovies(page: page);

      expect(result, isA<MovieListingsModel>());
      expect(result, equals(tMovieListingsModel));
    });

    test('should throw an [Exception()] when the call is unsuccessful',
        () async {
      when(mockDioClient.get(UrlConstants.popularMovies,
          queryParameters: {'page': page})).thenThrow(Exception());

      final call = actorRemoteDataSource.getPopularMovies;

      expect(call(page: page), throwsException);
    });
  });

  group('getTopRatedMovies', () {
    const page = 1;
    late final Response<dynamic> response;

    setUpAll(() {
      response = Response<dynamic>(
        data: movieListingsJson,
        requestOptions: RequestOptions(
            path: UrlConstants.topRatedMovies, queryParameters: {'page': page}),
      );
    });
  });

  group('getMovieCredits', () {
    const movieId = 1;
    final exception = Exception();
    late final Response<dynamic> response;

    setUpAll(() {
      response = Response<dynamic>(
        data: movieCreditJson,
        requestOptions: RequestOptions(
            path: UrlConstants.movieCredits
                .replaceAll('{movie_id}', movieId.toString())),
      );
    });

    test('should return [MovieCreditModel()] when the call is successful',
        () async {
      when(
        mockDioClient.get(
          UrlConstants.movieCredits.replaceAll(
            '{movie_id}',
            movieId.toString(),
          ),
        ),
      ).thenAnswer((_) async => response);

      final result =
          await actorRemoteDataSource.getMovieCredits(moveId: movieId);

      expect(result, isA<MovieCreditModel>());
      expect(result, equals(tMovieCreditModel));
    });

    test('should throw an [Exception()] when the call is unsuccessful',
        () async {
      when(
        mockDioClient.get(
          UrlConstants.movieCredits.replaceAll(
            '{movie_id}',
            movieId.toString(),
          ),
        ),
      ).thenThrow(exception);

      final call = actorRemoteDataSource.getMovieCredits;

      expect(call(moveId: movieId), throwsException);
    });
  });
}
