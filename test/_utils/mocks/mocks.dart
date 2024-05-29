import 'package:arquitetura_flutter_clean/src/core/network/dio_client.dart';
import 'package:arquitetura_flutter_clean/src/data/datasource/local/actor/movie_local_data_source.dart';
import 'package:arquitetura_flutter_clean/src/data/datasource/remote/actor/actor_remote_data_source.dart';
import 'package:arquitetura_flutter_clean/src/data/datasource/remote/movie/movie_remote_data_source.dart';
import 'package:arquitetura_flutter_clean/src/domain/repositories/actor/actor_repository.dart';
import 'package:arquitetura_flutter_clean/src/domain/repositories/movie/movie_repository.dart';
import 'package:arquitetura_flutter_clean/src/domain/usecases/actor/actor_usecases.dart';
import 'package:arquitetura_flutter_clean/src/domain/usecases/movie/movie_usecases.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  DioClient,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  ActorRemoteDataSource,
  MovieRepository,
  ActorRepository,
  MovieUsecases,
  ActorUsecases,
])
void main() {}
