
import 'package:arquitetura_flutter_clean/src/core/network/dio_client.dart';
import 'package:arquitetura_flutter_clean/src/data/datasource/remote/actor/actor_remote_data_source.dart';
import 'package:arquitetura_flutter_clean/src/data/models/actor_detail/actor_detail_model.dart';
import 'package:arquitetura_flutter_clean/src/data/models/actor_social_media/actor_social_media_model.dart';

import '../../../../core/constants/url_constants.dart';
import '../../../../core/exceptions/messages_standart.dart';

class ActorRemoteDataSourceImpl implements ActorRemoteDataSource{

  final DioClient _dioClient;

  ActorRemoteDataSourceImpl(this._dioClient);

  @override
  Future<ActorDetailModel> getActorDetail({required String actorId}) async{
    try {
      final resposnse = await _dioClient.get(
        UrlConstants.actorDetail.replaceAll('{person_id}', actorId),
      );
      final model = ActorDetailModel.fromJson(resposnse.data as Map<String, dynamic>);
      return model;
    } catch (e) {
      throw MessagesStandart(message: e.toString());
    }
  }

  @override
  Future<ActorSocialMediaModel> getActorSocialMedia({required String actorId}) async{
    try {
      final resposnse = await _dioClient.get(
        UrlConstants.actorSocialMedia.replaceAll('{person_id}', actorId),
      );
      final model = ActorSocialMediaModel.fromJson(resposnse.data as Map<String, dynamic>);
      return model;
    } catch (e) {
      throw MessagesStandart(message: e.toString());
    }
  }
  
}