// ignore_for_file: non_constant_identifier_names

import 'package:arquitetura_flutter_clean/src/data/models/movie_detail/movie_detail.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import '../../../core/mixins/entity_covertible.dart';
import '../../../domain/entities/movie_listings/movie_listings_entity.dart';

part 'movie_listings_model.g.dart';

@JsonSerializable()
class MovieListingsModel extends Equatable
    with EntityConvertible<MovieListingsModel, MovieListingsEntity> {
  final int? page;
  @JsonKey(name: 'results')
  final List<MovieDetailModel>? movies;
  @JsonKey(name: 'total_pages')
  final int? total_pages;
  @JsonKey(name: 'total_results')
  final int? total_results;

  MovieListingsModel({
    required this.page,
    required this.movies,
    required this.total_pages,
    required this.total_results,
  });

  factory MovieListingsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieListingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListingsModelToJson(this);

 @override
  MovieListingsEntity toEntity() => MovieListingsEntity(
        movies: movies?.map((e) => e.toEntity()).toList(),
        page: page,
        totalPages: total_pages!,
        totalResults: total_results,
      );

  @override
  List<Object?> get props => [page, movies, total_pages, total_results];
}
