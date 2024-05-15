
import 'package:arquitetura_flutter_clean/src/core/exceptions/messages_standart.dart';
import 'package:arquitetura_flutter_clean/src/data/datasource/local/actor/movie_local_data_source.dart';
import 'package:arquitetura_flutter_clean/src/data/datasource/local/collections/movie_detail_collection.dart';
import 'package:isar/isar.dart';

import '../../../../core/database/local_database.dart';

class MovieLocalDataSourceImpl implements MovieLocalDataSource{
  final LocalDatabase localDatabase;

  MovieLocalDataSourceImpl(this.localDatabase);

  @override
  Future<void> deleteMovieDetail({required int? movieId}) async{
    try {
      final db = localDatabase.db;
      await db.writeTxn(() async => db.movieDetailCollections.filter().idEqualTo(movieId).deleteAll());
    } catch (e) {
     throw MessagesStandart(message: e.toString()); 
    }
  }

  @override
  Future<List<MovieDetailCollection>> getSaveMovieDetail() async{
    try {
      final list = await localDatabase.db.movieDetailCollections.where().findAll();
      return list;
    } catch (e) {
     throw MessagesStandart(message: e.toString()); 
    }
  }

  @override
  Future<bool> isSaveMovieDetail({required int? movieId}) async{
    try {
      final db = localDatabase.db;
      final isSaved = await db.movieDetailCollections.filter().idEqualTo(movieId).isNotEmpty();
      return isSaved;
    } catch (e) {
     throw MessagesStandart(message: e.toString()); 
    }
  }

  @override
  Future<void> saveMovieDetail({required MovieDetailCollection movieDetailCollection}) async{
    try {
      final db = localDatabase.db;
      await db.writeTxn(() async => db.movieDetailCollections.put(movieDetailCollection));
    } catch (e) {
     throw MessagesStandart(message: e.toString()); 
    }
  }
  
}