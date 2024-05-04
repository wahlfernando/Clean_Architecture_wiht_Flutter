import 'package:arquitetura_flutter_clean/src/domain/entities/actor_detail/actor_detail_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/exceptions/network/network_exceptions.dart';

abstract class ActorRepository {
  Future<Either<NetworkExceptions, ActorDetailEntity>> getActorDetail({required String actorId});
  Future<Either<NetworkExceptions, ActorDetailEntity>> getActorSocialMedia({required String actorId});
}