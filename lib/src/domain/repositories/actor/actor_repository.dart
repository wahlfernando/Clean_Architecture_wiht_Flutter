import 'package:arquitetura_flutter_clean/src/domain/entities/actor_detail/actor_detail_entity.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/actor_social_media/actor_social_media_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/exceptions/network/network_exceptions.dart';

abstract class ActorRepository {
  Future<Either<NetworkException, ActorDetailEntity>> getActorDetail({required String actorId});
  Future<Either<NetworkException, ActorSocialMediaEntity>> getActorSocialMedia({required String actorId});
}