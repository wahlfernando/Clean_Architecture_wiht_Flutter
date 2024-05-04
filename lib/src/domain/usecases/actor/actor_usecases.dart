
import 'package:arquitetura_flutter_clean/src/core/exceptions/network/network_exceptions.dart';
import 'package:arquitetura_flutter_clean/src/domain/entities/actor_detail/actor_detail_entity.dart';
import 'package:arquitetura_flutter_clean/src/domain/repositories/actor/actor_repository.dart';
import 'package:fpdart/fpdart.dart';

class ActorUsecases {
  final ActorRepository _actorRepository;

  const ActorUsecases(this._actorRepository);

  Future<Either<NetworkExceptions, ActorDetailEntity>> getActorDetail({required String actorId}) async{
    return _actorRepository.getActorDetail(actorId: actorId);
  }
  
  Future<Either<NetworkExceptions, ActorDetailEntity>> getActorSocialMedia({required String actorId}) async{
    return _actorRepository.getActorSocialMedia(actorId: actorId);
  }

}