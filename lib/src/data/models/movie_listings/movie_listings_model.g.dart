// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_listings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListingsModel _$MovieListingsModelFromJson(Map<String, dynamic> json) =>
    MovieListingsModel(
      page: (json['page'] as num?)?.toInt(),
      movies: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total_pages: (json['total_pages'] as num?)?.toInt(),
      total_results: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieListingsModelToJson(MovieListingsModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.movies,
      'total_pages': instance.total_pages,
      'total_results': instance.total_results,
    };
