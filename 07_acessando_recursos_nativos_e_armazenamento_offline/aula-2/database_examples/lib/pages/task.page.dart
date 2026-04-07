import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../models/task.model.dart';
import '../stores/task.store.dart';

/// Página de lista de tarefas com formulário de adição e alternância de status.
class TaskPage extends StatefulWidget {
  final TaskStore taskStore;

  const TaskPage({super.key, required this.taskStore});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  void initState() {
    super.initState();
    widget.taskStore.loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _TaskFormWidget(taskStore: widget.taskStore),
          const Divider(),
          Expanded(child: _TaskListWidget(taskStore: widget.taskStore)),
        ],
      ),
    );
  }
}

/// Formulário de adição de nova tarefa.
class _TaskFormWidget extends StatelessWidget {
  final TaskStore taskStore;

  const _TaskFormWidget({required this.taskStore});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Nova tarefa...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.add_task_outlined),
              ),
              onChanged: (value) => taskStore.setNewTaskTitle(value),
              onSubmitted: (_) => taskStore.createTask(),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton.icon(
            onPressed: () => taskStore.createTask(),
            icon: const Icon(Icons.add),
            label: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }
}

/// Lista de tarefas com carregamento e estado vazio.
class _TaskListWidget extends StatelessWidget {
  final TaskStore taskStore;

  const _TaskListWidget({required this.taskStore});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (taskStore.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (taskStore.tasks.isEmpty) {
          return const Center(
            child: Text(
              'Nenhuma tarefa cadastrada ainda.',
              style: TextStyle(fontSize: 16),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: taskStore.tasks.length,
          itemBuilder: (_, index) {
            final task = taskStore.tasks[index];
            return _TaskTileWidget(
              task: task,
              onToggle: () => taskStore.toggleTask(task.id),
            );
          },
        );
      },
    );
  }
}

/// Tile individual de uma tarefa.
class _TaskTileWidget extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;

  const _TaskTileWidget({
    required this.task,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (_) => onToggle(),
      ),
      title: Text(
        task.titulo,
        style: TextStyle(
          fontSize: 16,
          decoration: task.isCompleted
              ? TextDecoration.lineThrough
              : null,
        ),
      ),
    );
  }
}
