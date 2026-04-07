import 'package:get_it/get_it.dart';

import 'adapters/secure_storage.adapter.dart';
import 'adapters/task_hive.adapter.dart';
import 'repositories/secure_token.repository.dart';
import 'repositories/task.repository.dart';
import 'services/create_task.service.dart';
import 'services/get_secure_token.service.dart';
import 'services/get_tasks.service.dart';
import 'services/save_secure_token.service.dart';
import 'services/toggle_task_status.service.dart';

final getIt = GetIt.instance;

/// Inicializa o Hive e registra as dependências do módulo de tarefas.
Future<void> initTasksDependencies() async {
  // Inicializa o Hive e abre a caixa de tarefas
  final taskAdapter = TaskHiveAdapter();
  await taskAdapter.init();
  getIt.registerLazySingleton<ITaskHiveAdapter>(() => taskAdapter);

  // Services
  getIt.registerLazySingleton<GetTasksLocalService>(
    () => GetTasksLocalService(getIt()),
  );

  getIt.registerLazySingleton<CreateTaskLocalService>(
    () => CreateTaskLocalService(getIt()),
  );

  getIt.registerLazySingleton<ToggleTaskStatusLocalService>(
    () => ToggleTaskStatusLocalService(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<TaskRepository>(
    () => TaskRepository(
      getTasks: getIt(),
      createTask: getIt(),
      toggleTaskStatus: getIt(),
    ),
  );

  // Secure Storage
  getIt.registerLazySingleton<ISecureStorageAdapter>(
    () => SecureStorageAdapter(),
  );

  getIt.registerLazySingleton<SaveSecureTokenLocalService>(
    () => SaveSecureTokenLocalService(getIt()),
  );

  getIt.registerLazySingleton<GetSecureTokenLocalService>(
    () => GetSecureTokenLocalService(getIt()),
  );

  getIt.registerLazySingleton<SecureTokenRepository>(
    () => SecureTokenRepository(
      saveToken: getIt(),
      getToken: getIt(),
    ),
  );
}
