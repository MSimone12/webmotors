import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:webmotors/src/core/http_client.dart';
import 'package:webmotors/src/data/datasource/remote_data_source.dart';
import 'dart:async';

import 'package:webmotors/src/di/injection_module.dart';
import 'package:webmotors/src/domain/repository/vehicles_repository.dart';
import 'package:webmotors/src/domain/usecases/get_vehicles_use_case.dart';
import 'package:webmotors/src/infra/datasources/app_remote_data_source.dart';
import 'package:webmotors/src/infra/repository/vehicles_repository.dart';
import 'package:webmotors/src/ui/screens/home/home_cubit.dart';

class AppInjectionModule implements InjectionModule {
  @override
  FutureOr<void> inject(GetIt injector) {
    injector.registerLazySingleton(
      () => HttpService(
        provider: Dio(),
      ),
    );

    injector.registerFactory<RemoteDataSource>(
      () => AppRemoteDataSource(
        injector.get(),
      ),
    );

    injector.registerFactory<VehiclesRepository>(
      () => AppVehiclesRepository(
        injector.get(),
      ),
    );

    injector.registerFactory<GetVehiclesUseCase>(
      () => GetVehicles(
        injector.get(),
      ),
    );

    injector.registerFactory<HomeCubit>(
      () => HomeCubit(
        injector.get(),
      ),
    );
  }
}
