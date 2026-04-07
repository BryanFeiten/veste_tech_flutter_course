import '../models/task.model.dart';
import '../services/get_tasks.service.dart';
import '../services/create_task.service.dart';
import '../services/toggle_task_status.service.dart';

/// Repositório que orquestra os serviços de tarefas.
class TaskRepository {
  final GetTasksLocalService _getTasks;
  final CreateTaskLocalService _createTask;
  final ToggleTaskStatusLocalService _toggleTaskStatus;

  TaskRepository({
    required GetTasksLocalService getTasks,
    required CreateTaskLocalService createTask,
    required ToggleTaskStatusLocalService toggleTaskStatus,
  })  : _getTasks = getTasks,
        _createTask = createTask,
        _toggleTaskStatus = toggleTaskStatus;

  /// Retorna todas as tarefas salvas.
  Future<List<Task>> getTasks() => _getTasks();

  /// Cria uma nova tarefa com o [titulo] informado.
  Future<Task> createTask(String titulo) => _createTask(titulo);

  /// Alterna o status de conclusão da tarefa com o [taskId].
  Future<void> toggleTaskStatus(String taskId) => _toggleTaskStatus(taskId);
}
