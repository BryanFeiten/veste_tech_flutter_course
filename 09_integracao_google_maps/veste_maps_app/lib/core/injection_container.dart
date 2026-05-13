import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:veste_maps_app/services/fetch_outlets.service.dart';

final sl = GetIt.I;

void _registerLibs() {
  sl.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://5acf-189-6-235-147.ngrok-free.app',
        validateStatus: (_) => true,
      ),
    ),
  );
}

void _registerServices() {
  sl.registerLazySingleton(() => FetchOutletsService(sl()));
}

void registerDependencies() {
  _registerLibs();
  _registerServices();
}
