import '../../../models/movie_listings/movie_listings_model.dart';

abstract class MovieRemoteDataSource {
  Future<MovieListingsModel> getPopularMovies({required int page});
  Future<MovieListingsModel> getTopRateMovies({required int page});
  Future<MovieListingsModel> getMovieCredits({required int moveId});
}