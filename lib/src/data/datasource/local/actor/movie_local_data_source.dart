import 'package:arquitetura_flutter_clean/src/data/datasource/local/collections/movie_detail_collection.dart';

abstract class MovieLocalDataSource {
  const MovieLocalDataSource();
  Future<void> saveMovieDetail({required MovieDetailCollection movieDetailCollection});
  Future<void> deleteMovieDetail({required int? movieId});
  Future<bool> isSaveMovieDetail({required int? movieId});
  Future<List<MovieDetailCollection>> getSaveMovieDetail();
}