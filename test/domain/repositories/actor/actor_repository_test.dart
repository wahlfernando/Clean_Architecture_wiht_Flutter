import 'package:arquitetura_flutter_clean/src/core/exceptions/network/network_exceptions.dart';
import 'package:arquitetura_flutter_clean/src/core/network/dio_client.dart';
import 'package:arquitetura_flutter_clean/src/data/datasource/remote/actor/actor_remote_data_source.dart';
import 'package:arquitetura_flutter_clean/src/data/datasource/remote/actor/actor_remote_data_source_impl.dart';
import 'package:arquitetura_flutter_clean/src/data/models/actor_detail/actor_detail_model.dart';
import 'package:arquitetura_flutter_clean/src/data/models/actor_social_media/actor_social_media_model.dart';
import 'package:arquitetura_flutter_clean/src/data/repositories/actor/actor_repository_impl.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/actor_detail/actor_detail_entity.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/actor_social_media/actor_social_media_entity.dart';
import 'package:arquitetura_flutter_clean/src/domain/repositories/actor/actor_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final DioClient mockDioClient;
  late final ActorRemoteDataSource mockActorRemoteDataSource;
  late final ActorRepository actorRepositoryImpl;

  late final ActorDetailModel tActorDetailModel;
  late final ActorSocialMediaModel tActorSocialMediaModel;

  late final ActorDetailEntity tActorDetailEntity;
  late final ActorSocialMediaEntity tActorSocialMediaEntity;

  setUpAll(() {
    mockDioClient = MockDioClient();
    mockActorRemoteDataSource = ActorRemoteDataSourceImpl(mockDioClient);
    actorRepositoryImpl = ActorRepositoryImpl(mockActorRemoteDataSource);

    tActorDetailModel = const ActorDetailModel(
      id: 1,
      name: 'name',
      biography: 'biography',
      birthday: 'birthday',
      deathday: 'deathday',
      placeOfBirth: 'placeOfBirth',
      profilePath: 'profilePath',
    );

    tActorDetailEntity = const ActorDetailEntity(
      id: 1,
      name: 'name',
      biography: 'biography',
      birthday: 'birthday',
      deathday: 'deathday',
      placeOfBirth: 'placeOfBirth',
      profilePath: 'profilePath',
    );

    tActorSocialMediaModel = const ActorSocialMediaModel(
      id: 1,
      facebookId: 'facebookId',
      instagramId: 'instagramId',
      twitterId: 'twitterId',
    );

    tActorSocialMediaEntity = const ActorSocialMediaEntity(
      id: 1,
      facebookId: 'facebookId',
      instagramId: 'instagramId',
      twitterId: 'twitterId',
    );
  });

  group('getActorDetail', () {
    const tId = '1';
    final tDioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        statusMessage: 'Not Found',
      ),
    );

    test('should return [ActorDetailEntity] when the call to remote data source is successful', () async {
      when(mockActorRemoteDataSource.getActorDetail(actorId: tId)).thenAnswer((_) async => tActorDetailModel);
      final result = await actorRepositoryImpl.getActorDetail(actorId: tId);
      expect(result, equals(Right(tActorDetailEntity)));
    });

    test('should return [NetworkException] when the call to remote data source is unsuccessful', () async {
      when(mockActorRemoteDataSource.getActorDetail(actorId: tId)).thenThrow(tDioException);
      final result = await actorRepositoryImpl.getActorDetail(actorId: tId);
      expect(result, equals(Left(NetworkException.fromDioError(tDioException))));
    });
  });

  group('getActorSocialMedia', () {
    const tId = '1';
    final tDioException = DioException(
      requestOptions: RequestOptions(),
      error: Exception(),
      response: Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        statusMessage: 'Not Found',
      ),
    );

    test('should return [ActorDetailEntity] when the call to remote data source is successful', () async {
      when(mockActorRemoteDataSource.getActorSocialMedia(actorId: tId)).thenAnswer((_) async => tActorSocialMediaModel);
      final result = await actorRepositoryImpl.getActorSocialMedia(actorId: tId);
      expect(result, equals(Right(tActorSocialMediaEntity)));
    });

    test('should return [NetworkException] when the call to remote data source is unsuccessful', () async {
      when(mockActorRemoteDataSource.getActorSocialMedia(actorId: tId)).thenThrow(tDioException);
      final result = await actorRepositoryImpl.getActorSocialMedia(actorId: tId);
      expect(result, equals(Left(NetworkException.fromDioError(tDioException))));
    });
  });
}
