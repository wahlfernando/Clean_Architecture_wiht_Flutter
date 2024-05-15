import 'package:arquitetura_flutter_clean/src/core/mixins/entity_covertible.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/movie_detail/movie_detail_entity.dart';

import 'package:isar/isar.dart';

part 'movie_detail_collection.g.dart';

@collection
class MovieDetailCollection
    with EntityConvertible<MovieDetailCollection, MovieDetailEntity> {
  final Id? id;
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieDetailCollection({
    this.id,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    });

  @override
  MovieDetailEntity toEntity() {
    return MovieDetailEntity(
      id: id,
      posterPath: posterPath,
      adult: adult,
      overview: overview,
      releaseDate: releaseDate,
      genreIds: genreIds,
      originalTitle: originalTitle,
      originalLanguage: originalLanguage,
      title: title,
      backdropPath: backdropPath,
      popularity: popularity,
      voteCount: voteCount,
      video: video,
      voteAverage: voteAverage,
    );
  }

  @override
  MovieDetailCollection frontEntity(MovieDetailEntity? model) {
    return MovieDetailCollection(
      id: model?.id,
      adult: model?.adult,
      backdropPath: model?.backdropPath,
      genreIds: model?.genreIds,
      originalLanguage: model?.originalLanguage,
      originalTitle: model?.originalTitle,
      overview: model?.overview,
      popularity: model?.popularity,
      posterPath: model?.posterPath,
      releaseDate: model?.releaseDate,
      title: model?.title,
      video: model?.video,
      voteAverage: model?.voteAverage,
      voteCount: model?.voteCount,
    );
  }
}
