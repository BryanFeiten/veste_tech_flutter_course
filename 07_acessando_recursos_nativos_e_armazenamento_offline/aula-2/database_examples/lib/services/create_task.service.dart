import '../adapters/task_hive.adapter.dart';
import '../models/task.model.dart';

/// Serviço responsável por criar e salvar uma nova tarefa.
class CreateTaskLocalService {
  final ITaskHiveAdapter _taskAdapter;

  CreateTaskLocalService(this._taskAdapter);

  /// Cria uma nova tarefa com o [titulo] informado e a salva.
  Future<Task> call(String titulo) async {
    final task = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      titulo: titulo,
    );
    await _taskAdapter.save(task);
    return task;
  }
}
