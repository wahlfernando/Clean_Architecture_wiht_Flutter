import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import '../../../core/mixins/entity_covertible.dart';
import '../../../domain/entities/movie_detail/movie_detail_entity.dart';

part 'movie_detail.g.dart';

@JsonSerializable()
class MovieDetailModel extends Equatable
    with EntityConvertible<MovieDetailModel, MovieDetailEntity> {
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  final int? id;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  final String? title;
  final bool? video;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  const MovieDetailModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
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

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return _$MovieDetailModelFromJson(json);
  }

  @override
  MovieDetailEntity toEntity() => MovieDetailEntity(
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

  Map<String, dynamic> toJson() => _$MovieDetailModelToJson(this);

  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      genreIds,
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      video,
      voteAverage,
      voteCount,
    ];
  }
}
