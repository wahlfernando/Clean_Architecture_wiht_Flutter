
import 'package:arquitetura_flutter_clean/src/data/datasource/remote/movie/movie_remote_data_source.dart';
import 'package:arquitetura_flutter_clean/src/data/models/movie_listings/movie_listings_model.dart';

import '../../../../core/network/dio_client.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource{
  final DioClient _dioClient;

  MovieRemoteDataSourceImpl(this._dioClient);
  
  @override
  Future<MovieListingsModel> getMovieCredits({required int moveId}) {
    
  }

  @override
  Future<MovieListingsModel> getPopularMovies({required int page}) {
    
  }

  @override
  Future<MovieListingsModel> getTopRateMovies({required int page}) {
    
  }
  
}