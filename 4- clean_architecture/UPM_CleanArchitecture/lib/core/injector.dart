import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:user_profile_management/data/datasources/user_remote_data_source.dart';
import 'package:user_profile_management/data/repositories/user_repository_impl.dart';
import 'package:user_profile_management/domain/repositories/user_repository.dart';
import 'package:user_profile_management/domain/usecases/get_users.dart';
import 'package:user_profile_management/presentation/bloc/user_cubit.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Data sources
  getIt.registerLazySingleton(
    () => UserRemoteDataSource(
      dio: Dio(
        BaseOptions(
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
        ),
      ),
    ),
  );

  // Repositories
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetUsersUseCase(getIt()));

  // Bloc
  getIt.registerLazySingleton(() => UserCubit(getIt()));
}
