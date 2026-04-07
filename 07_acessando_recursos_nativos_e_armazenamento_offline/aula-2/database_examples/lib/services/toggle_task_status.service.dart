import '../adapters/task_hive.adapter.dart';

/// Serviço responsável por alternar o status de conclusão de uma tarefa.
class ToggleTaskStatusLocalService {
  final ITaskHiveAdapter _taskAdapter;

  ToggleTaskStatusLocalService(this._taskAdapter);

  /// Alterna o status [isCompleted] da tarefa com o [taskId] informado.
  Future<void> call(String taskId) async {
    // Busca a tarefa pelo ID
    final tasks = await _taskAdapter.getAll();
    final task = tasks.firstWhere(
      (t) => t.id == taskId,
      orElse: () => throw Exception('Tarefa com ID $taskId não encontrada.'),
    );

    // Alterna o status e atualiza
    task.isCompleted = !task.isCompleted;
    await _taskAdapter.update(task);
  }
}
