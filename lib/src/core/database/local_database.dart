import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/datasource/local/collections/movie_detail_collection.dart';

class LocalDatabase {
  late final Isar _isar;
  bool _isInitialized = false;

  Isar get db => _isInitialized ? _isar : throw IsarError('Isar não foi inicializado.');

  Future<void> initialize() async {
    if (_isInitialized) throw IsarError('Isar foi inicializado.');

    final directory = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([MovieDetailCollectionSchema], directory: directory.path);

    _isInitialized = true;
  }
}