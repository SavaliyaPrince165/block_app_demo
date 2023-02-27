import 'package:block_app_demo/data/core/api_client.dart';
import 'package:block_app_demo/data/data_sources/movies_remote_data_source.dart';
import 'package:block_app_demo/data/repositories/movies_repository_impl.dart';
import 'package:block_app_demo/domain/repositories/movie_repository.dart';
import 'package:block_app_demo/domain/usecases/get_coming_soon.dart';
import 'package:block_app_demo/domain/usecases/get_playing_now.dart';
import 'package:block_app_demo/domain/usecases/get_popular.dart';
import 'package:block_app_demo/domain/usecases/get_trending.dart';
import 'package:block_app_demo/presentation/blocs/bloc_carousel/movie_carousel_bloc.dart';
import 'package:block_app_demo/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInStance = GetIt.I;

Future init() async {
  getItInStance.registerLazySingleton<Client>(() => Client());

  getItInStance.registerLazySingleton<ApiClient>(
    () => ApiClient(getItInStance()),
  );

  getItInStance.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(getItInStance()),
  );
  getItInStance.registerLazySingleton<GetTrending>(
    () => GetTrending(getItInStance()),
  );
  getItInStance.registerLazySingleton<GetComingSoon>(
    () => GetComingSoon(getItInStance()),
  );
  getItInStance.registerLazySingleton<GetPlayingNow>(
    () => GetPlayingNow(getItInStance()),
  );
  getItInStance.registerLazySingleton<GetPopular>(
    () => GetPopular(getItInStance()),
  );
  getItInStance.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(getItInStance()),
  );

  getItInStance.registerFactory(
    () => MovieBackdropBloc(),
  );

  getItInStance.registerFactory(
    () => MovieCarouselBloc(
      getTrending: getItInStance(),
      movieBackdropBloc: getItInStance(),
    ),
  );
}
