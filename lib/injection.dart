import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mubaha/data/remote/dio_di.dart';

import 'package:mubaha/ui/app_cubit.dart';

final getIt = GetIt.instance;
void configureDependencies() {
  getIt.registerLazySingleton<Dio>(() => _DioDi().dio);

  // getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(
  //       getIt.get<Dio>(),
  //       baseUrl: "https://reqres.in",
  //     ));
  // getIt.registerLazySingleton<CustomerRepository>(() => CustomerRepository(
  //       getIt.get<Dio>(),
  //       baseUrl: "https://api-dev.mubaha.com",
  //       // baseUrl: "https://api-dev.mubaha.com",
  //     ));
  // getIt.registerLazySingleton<VendorRepository>(() => VendorRepository(
  //       getIt.get<Dio>(),
  //       baseUrl: "https://reqres.in",
  //     ));

  getIt.registerLazySingleton<AppCubit>(() => AppCubit());
  // getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
}

class _DioDi extends DioDi {}
