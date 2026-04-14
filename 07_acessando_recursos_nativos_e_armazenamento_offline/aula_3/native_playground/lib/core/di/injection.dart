import 'package:get_it/get_it.dart';
import 'package:native_playground/features/camera_demo/adapters/camera_adapter.dart';
import 'package:native_playground/features/haptic_demo/adapters/haptic_adapter.dart';
import 'package:native_playground/features/haptic_demo/usecases/trigger_semantic_haptic_usecase.dart';

final GetIt sl = GetIt.instance;

/// Configuração de Injeção de Dependência do projeto.
void setupInjection() {
  // Adapters
  sl.registerLazySingleton<ICameraAdapter>(() => CameraAdapter());
  sl.registerLazySingleton<IHapticAdapter>(() => HapticAdapter());

  // UseCases
  sl.registerLazySingleton(() => TriggerSemanticHapticUseCase(sl<IHapticAdapter>()));
}
