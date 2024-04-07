import 'package:get_it/get_it.dart';
import 'package:notes/features/users_paginations/data/repos/users_repo.dart';

import '../../features/login/data/repos/login_repo.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';
import '../networking/api_handler.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<UsersRepo>(() => UsersRepo(getIt()));
  getIt.registerLazySingleton<ApiHandler>(
      () => ApiHandler(createDioandSetupInterceptors()));
}
