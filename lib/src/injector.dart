part of '../main.dart';

final injector = GetIt.instance;

Future<void> init() async {
  injector
    ..registerLazySingleton<DioClient>(DioClient.new)

    ..registerLazySingleton<LocalDatabase>(LocalDatabase.new)

    ..registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(injector()))
    ..registerLazySingleton<MovieLocalDataSource>(() => MovieLocalDataSourceImpl(injector<LocalDatabase>()))
    ..registerLazySingleton<ActorRemoteDataSource>(() => ActorRemoteDataSourceImpl(injector()))

    ..registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(injector(), injector()))
    ..registerLazySingleton<ActorRepository>(() => ActorRepositoryImpl(injector()))

    ..registerLazySingleton<MovieUsecases>(() => MovieUsecases(injector()))
    ..registerLazySingleton<ActorUsecases>(() => ActorUsecases(injector()))

    ..registerLazySingleton<ThemeCubit>(ThemeCubit.new)
    ..registerLazySingleton<GetPopularMoviesCubit>(() => GetPopularMoviesCubit(injector()))
    ..registerLazySingleton<GetTopRatedMoviesCubit>(() => GetTopRatedMoviesCubit(injector()))
    ..registerLazySingleton<GetSavedMoviesCubit>(() => GetSavedMoviesCubit(injector()))
    ..registerFactory<ToggleBookmarkCubit>(() => ToggleBookmarkCubit(injector()))
    ..registerFactory<GetMovieCreditsCubit>(() => GetMovieCreditsCubit(injector()))
    ..registerLazySingleton<GetActorDetailCubit>(() => GetActorDetailCubit(injector()))
    ..registerFactory<GetActorSocialMediaCubit>(() => GetActorSocialMediaCubit(injector()));
}
