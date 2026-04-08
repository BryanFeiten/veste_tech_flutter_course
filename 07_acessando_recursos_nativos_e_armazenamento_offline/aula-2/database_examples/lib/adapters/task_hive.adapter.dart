import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../models/task.model.dart';

/// Interface para operações CRUD de tarefas no Hive.
/// Oculta os detalhes de implementação do pacote Hive.
abstract interface class ITaskHiveAdapter {
  /// Inicializa o Hive e registra os adapters necessários.
  Future<void> init();

  /// Retorna todas as tarefas salvas.
  Future<List<Task>> getAll();

  /// Salva uma nova [task].
  Future<void> save(Task task);

  /// Atualiza uma tarefa existente.
  Future<void> update(Task task);

  /// Remove uma tarefa pelo [id].
  Future<void> delete(String id);

  /// Limpa todos os dados da caixa de tarefas.
  Future<void> clear();
}

/// ADAPTER DO HIVE É DIFERENTE DO ADAPTER DESIGN PATTERN
///
/// Implementação concreta que utiliza o Hive como banco de dados local.
class TaskHiveAdapter implements ITaskHiveAdapter {
  static const String _boxName = 'tasks';
  late Box<Task> _box;
  // late LazyBox<Task> _lazyBox;

  @override
  Future<void> init() async {
    // Inicializa o Hive com o diretório de documentos do app
    final appDocsDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocsDir.path);

    // Registra o adapter do modelo Task (typeId 0)
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(TaskAdapter());
    }

    // _lazyBox = await Hive.openLazyBox('lazy_box');
    // _lazyBox.get(key);

    // Abre a caixa de tarefas
    if (!Hive.isBoxOpen(_boxName)) {
      _box = await Hive.openBox<Task>(_boxName);
    } else {
      _box = Hive.box<Task>(_boxName);
    }
  }

  @override
  Future<List<Task>> getAll() async {
    return _box.values.toList();
  }

  @override
  Future<void> save(Task task) async {
    await _box.put(task.id, task);
  }

  @override
  Future<void> update(Task task) async {
    await _box.put(task.id, task);
  }

  @override
  Future<void> delete(String id) async {
    await _box.delete(id);
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }
}
