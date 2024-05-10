import '../../../models/actor_detail/actor_detail_model.dart';
import '../../../models/actor_social_media/actor_social_media_model.dart';

abstract class ActorRemoteDataSource {
  Future<ActorDetailModel> getActorDetail({required String actorId});
  Future<ActorSocialMediaModel> getActorSocialMedia({required String actorId});
}


