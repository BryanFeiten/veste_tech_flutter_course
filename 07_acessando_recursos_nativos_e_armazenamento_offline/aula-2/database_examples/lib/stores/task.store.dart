import 'package:mobx/mobx.dart';

import '../models/task.model.dart';
import '../repositories/task.repository.dart';

part 'task.store.g.dart';

/// Store responsável por gerenciar o estado das tarefas.
// ignore: library_private_types_in_public_api
class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  _TaskStore(this._repository);

  final TaskRepository _repository;

  /// Lista privada de tarefas – acesso apenas via getter público.
  @observable
  ObservableList<Task> _tasks = ObservableList<Task>();
  ObservableList<Task> get tasks => _tasks;

  /// Controla se a operação de carregamento está em andamento.
  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// Texto do campo de nova tarefa.
  @observable
  String _newTaskTitle = '';
  String get newTaskTitle => _newTaskTitle;

  /// Carrega todas as tarefas do repositório.
  @action
  Future<void> loadTasks() async {
    _isLoading = true;
    try {
      final result = await _repository.getTasks();
      _tasks.clear();
      _tasks.addAll(result);
    } catch (e) {
      /* Em caso de falha, mantém a lista atual */
    } finally {
      _isLoading = false;
    }
  }

  /// Cria uma nova tarefa com o título informado e recarrega a lista.
  @action
  Future<void> createTask() async {
    if (_newTaskTitle.trim().isEmpty) return;

    await _repository.createTask(_newTaskTitle.trim());
    _newTaskTitle = '';
    await loadTasks();
  }

  /// Alterna o status de conclusão de uma tarefa.
  @action
  Future<void> toggleTask(String taskId) async {
    await _repository.toggleTaskStatus(taskId);
    await loadTasks();
  }

  /// Atualiza o texto da nova tarefa enquanto o usuário digita.
  @action
  void setNewTaskTitle(String value) {
    _newTaskTitle = value;
  }
}
