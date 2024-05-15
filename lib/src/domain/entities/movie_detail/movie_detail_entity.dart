import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable {
  final int? id;
  final String? posterPath;
  final bool? adult;
  final String? overview;
  final String? releaseDate;
  final List<int>? genreIds;
  final String? originalTitle;
  final String? originalLanguage;
  final String? title;
  final String? backdropPath;
  final double? popularity;
  final int? voteCount;
  final bool? video;
  final double? voteAverage;

  const MovieDetailEntity({
    required this.id,
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
    required this.originalTitle,
    required this.originalLanguage,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        id,
        posterPath,
        adult,
        overview,
        releaseDate,
        genreIds,
        originalTitle,
        originalLanguage,
        title,
        backdropPath,
        popularity,
        voteCount,
        video,
        voteAverage,
      ];

//   @override
//   List<Object> get props => [
//     return {
  // posterPath,
  // adult,
  // overview,
  // releaseDate,
  // genreIds,
  // id,
  // originalTitle,
  // originalLanguage,
  // title,
  // backdropPath,
  // popularity,
  // voteCount,
  // video,
  // voteAverage,}
//   ];
}
