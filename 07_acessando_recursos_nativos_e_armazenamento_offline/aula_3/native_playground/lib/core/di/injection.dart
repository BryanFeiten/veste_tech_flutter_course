import 'package:get_it/get_it.dart';
import 'package:native_playground/features/camera_demo/adapters/camera_adapter.dart';

final GetIt sl = GetIt.instance;

/// Configuração de Injeção de Dependência do projeto.
void setupInjection() {
  // Adapters
  sl.registerLazySingleton<ICameraAdapter>(() => CameraAdapter());
}
