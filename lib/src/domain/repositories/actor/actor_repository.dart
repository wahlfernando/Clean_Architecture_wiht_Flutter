import 'package:arquitetura_flutter_clean/src/domain/entities/actor_detail/actor_detail_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class ActorRepository {
  Future<Either<NetworkException, ActorDetailEntity>> getActorDetail({required int actorId});
  Future<Either<NetworkException, ActorDetailEntity>> getActorSocialMedia({required int actorId});
}