
import 'package:arquitetura_flutter_clean/src/core/exceptions/network/network_exceptions.dart';
import 'package:arquitetura_flutter_clean/src/data/datasource/remote/actor/actor_remote_data_source.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/actor_detail/actor_detail_entity.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/actor_social_media/actor_social_media_entity.dart';
import 'package:arquitetura_flutter_clean/src/domain/repositories/actor/actor_repository.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';

class ActorRepositoryImpl implements ActorRepository{
  final ActorRemoteDataSource _actorRemoteDataSource;

  ActorRepositoryImpl(this._actorRemoteDataSource);

  @override
  Future<Either<NetworkException, ActorDetailEntity>> getActorDetail({required String actorId}) async{
    try {
      final result = await _actorRemoteDataSource.getActorDetail(actorId: actorId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, ActorSocialMediaEntity>> getActorSocialMedia({required String actorId}) async {
    try {
      final result = await _actorRemoteDataSource.getActorSocialMedia(actorId: actorId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }
  
}