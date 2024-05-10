import 'package:arquitetura_flutter_clean/src/core/constants/url_constants.dart';
import 'package:arquitetura_flutter_clean/src/core/exceptions/messages_standart.dart';
import 'package:arquitetura_flutter_clean/src/data/datasource/remote/movie/movie_remote_data_source.dart';
import 'package:arquitetura_flutter_clean/src/data/models/movie_listings/movie_listings_model.dart';

import '../../../../core/network/dio_client.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final DioClient _dioClient;

  MovieRemoteDataSourceImpl(this._dioClient);

  @override
  Future<MovieListingsModel> getPopularMovies({required int page}) async {
    try {
      final resposnse = await _dioClient.get(
        UrlConstants.popularMovies,
        queryParameters: {'page': page},
      );
      final model = MovieListingsModel.fromJson(resposnse.data as Map<String, dynamic>);
      return model;
    } catch (e) {
      throw MessagesStandart(message: e.toString());
    }
  }
  
  @override
  Future<MovieListingsModel> getTopRateMovies({required int page}) async{
    try {
      final resposnse = await _dioClient.get(
        UrlConstants.topRatedMovies,
        queryParameters: {'page': page},
      );
      final model = MovieListingsModel.fromJson(resposnse.data as Map<String, dynamic>);
      return model;
    } catch (e) {
      throw MessagesStandart(message: e.toString());
    }
  }

  @override
  Future<MovieListingsModel> getMovieCredits({required int moveId}) async {
    try {
      final resposnse = await _dioClient.get(
        UrlConstants.movieCredits.replaceAll('{move_id}', moveId.toString())
      );
      final model = MovieListingsModel.fromJson(resposnse.data as Map<String, dynamic>);
      return model;
    } catch (e) {
      throw MessagesStandart(message: e.toString());
    }
  }

}
