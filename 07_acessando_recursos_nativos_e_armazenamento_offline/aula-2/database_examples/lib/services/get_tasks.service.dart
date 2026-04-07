import '../adapters/task_hive.adapter.dart';
import '../models/task.model.dart';

/// Serviço responsável por listar todas as tarefas salvas localmente.
class GetTasksLocalService {
  final ITaskHiveAdapter _taskAdapter;

  GetTasksLocalService(this._taskAdapter);

  /// Retorna a lista de todas as tarefas.
  Future<List<Task>> call() async {
    return await _taskAdapter.getAll();
  }
}
