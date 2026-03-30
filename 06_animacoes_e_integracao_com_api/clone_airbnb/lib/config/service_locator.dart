import 'package:clone_airbnb/adapters/http_client.adapter.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

void _slRegisterLibs() {
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://69b07d20c63dd197febc64c3.mockapi.io/api',
        validateStatus: (_) => true,
      ),
    ),
  );
  // sl.registerLazySingleton<HttpClient>(() => HttpClient());
}

void _slAdapters() {
  sl.registerLazySingleton<IHttpClientAdapter>(() => ApiAdapter(sl()));
}

void main() {
  _slRegisterLibs();
  _slAdapters();
}

// void comoAcessarUmaInstanciaCadastrada() {
  // final httpClient = GetIt.I<Dio>();
  // final httpClient = GetIt.I.get<Dio>();
  // final httpClient = sl.get<Dio>();
  // final httpClient = sl<Dio>();
// }
