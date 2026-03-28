import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/feature/home/data/datasource/home_remote_data_source.dart';
import 'package:rick_and_morty/feature/home/data/datasource/home_remote_data_source_impl.dart';
import 'package:rick_and_morty/feature/home/data/repository/home_repository_impl.dart';
import 'package:rick_and_morty/feature/home/domain/repository/home_repository.dart';
import 'package:rick_and_morty/feature/home/domain/usecase/get_character_page.dart';
import 'package:rick_and_morty/feature/home/presentation/bloc/home_cubit.dart';

abstract class DI {
  static final getIt = GetIt.instance;

  static Future<void> init() async {
    // HOME
    // Data source
    getIt.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(),
    );

    // Repository
    getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: getIt()),
    );

    // Use case
    getIt.registerLazySingleton(() => GetCharacterPage(getIt()));

    // Bloc
    getIt.registerLazySingleton(() => HomeCubit(getCharacterPage: getIt()));
  }
}
