import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/feature/favorite/data/datasource/favorite_local_data_source.dart';
import 'package:rick_and_morty/feature/favorite/data/datasource/favorite_local_data_source_impl.dart';
import 'package:rick_and_morty/feature/favorite/data/repository/favorite_repository_impl.dart';
import 'package:rick_and_morty/feature/favorite/domain/repository/favorite_repository.dart';
import 'package:rick_and_morty/feature/favorite/domain/usecase/get_favorite_character_list.dart';
import 'package:rick_and_morty/feature/favorite/presentation/bloc/favorite_cubit.dart';
import 'package:rick_and_morty/feature/home/data/datasource/home_local_data_source.dart';
import 'package:rick_and_morty/feature/home/data/datasource/home_local_data_source_impl.dart';
import 'package:rick_and_morty/feature/home/data/datasource/home_remote_data_source.dart';
import 'package:rick_and_morty/feature/home/data/datasource/home_remote_data_source_impl.dart';
import 'package:rick_and_morty/feature/home/data/repository/home_repository_impl.dart';
import 'package:rick_and_morty/feature/home/domain/repository/home_repository.dart';
import 'package:rick_and_morty/feature/home/domain/usecase/get_character_page.dart';
import 'package:rick_and_morty/feature/home/domain/usecase/update_character_list.dart';
import 'package:rick_and_morty/feature/home/presentation/bloc/home_cubit.dart';
import 'package:rick_and_morty/service/local/local.dart';
import 'package:rick_and_morty/shared/data/datasource/shared_local_data_source.dart';
import 'package:rick_and_morty/shared/data/datasource/shared_local_data_source_impl.dart';
import 'package:rick_and_morty/shared/data/repository/shared_repository_impl.dart';
import 'package:rick_and_morty/shared/domain/repository/shared_repository.dart';
import 'package:rick_and_morty/shared/domain/usecase/delete_character.dart';
import 'package:rick_and_morty/shared/domain/usecase/save_character.dart';

abstract class DI {
  static final getIt = GetIt.instance;

  static Future<void> init() async {
    // SERVICES
    await Local.init();

    // SHARED
    // Data source
    getIt.registerLazySingleton<SharedLocalDataSource>(
      () => SharedLocalDataSourceImpl(),
    );

    // Repository
    getIt.registerLazySingleton<SharedRepository>(
      () => SharedRepositoryImpl(localDataSource: getIt()),
    );

    // Use case
    getIt.registerLazySingleton(() => SaveCharacter(getIt()));
    getIt.registerLazySingleton(() => DeleteCharacter(getIt()));

    // Bloc

    // HOME
    // Data source
    getIt.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(),
    );
    getIt.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl(),
    );

    // Repository
    getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        remoteDataSource: getIt(),
        localDataSource: getIt(),
      ),
    );

    // Use case
    getIt.registerLazySingleton(() => GetCharacterPage(getIt()));
    getIt.registerLazySingleton(() => UpdateCharacterList(getIt()));

    // Bloc
    getIt.registerLazySingleton(
      () => HomeCubit(
        getCharacterPage: getIt(),
        updateCharacterList: getIt(),
        saveCharacter: getIt(),
        deleteCharacter: getIt(),
      ),
    );

    // FAVORITE
    // Data source
    getIt.registerLazySingleton<FavoriteLocalDataSource>(
      () => FavoriteLocalDataSourceImpl(),
    );

    // Repository
    getIt.registerLazySingleton<FavoriteRepository>(
      () => FavoriteRepositoryImpl(localDataSource: getIt()),
    );

    // Use case
    getIt.registerLazySingleton(() => GetFavoriteCharacterList(getIt()));

    // Bloc
    getIt.registerLazySingleton(
      () => FavoriteCubit(
        getFavoriteCharacterList: getIt(),
        deleteCharacter: getIt(),
      ),
    );
  }
}
