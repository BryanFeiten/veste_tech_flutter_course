import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tasks_app/models/task.model.dart';
import 'package:tasks_app/pages/add_task_form.page.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final List<Task> tasks = [
    // Task(title: 'Gravar aula', description: 'Aula de Flutter', important: true),
    // Task(title: 'Ir na academia', important: true),
    Task(title: 'Fazer compras (mercado)'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddTaskPage,
        // onPressed: showBottomSheet,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text('Tasks'), centerTitle: true),
      body: Padding(
        padding: .all(10),
        child: ListView.builder(
          itemCount: tasks.length,

          itemBuilder: (ctx, index) {
            final task = tasks[index];

            return Card(
              elevation: 3,
              color: Colors.indigo[50],
              shape: RoundedRectangleBorder(borderRadius: .circular(10)),
              child: ListTile(
                title: Text(task.title),
                subtitle: task.description != null
                    ? Text(task.description!)
                    : null,
                leading: Checkbox(
                  value: task.completed,
                  onChanged: (value) => task.completed = value ?? false,
                ),
                trailing: task.important
                    ? Icon(Icons.star, color: Colors.indigo)
                    : Icon(Icons.star_border, color: Colors.indigo),
              ),
            );
          },
        ),
      ),
    );
  }

  void test() async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (internalCtx) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: .stretch,
          mainAxisSize: .min,
          spacing: 24,
          children: [
            Text('Você aceita os termos de uso do app?'),
            FilledButton(
              onPressed: () => Navigator.pop(internalCtx, true),
              child: Text('Aceitar'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(internalCtx, false),
              child: Text('Negar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showBottomSheet() async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (internalCtx) => Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: .stretch,
          mainAxisSize: .min,
          spacing: 24,
          children: [
            Text('Você aceita os termos de uso do app?'),
            FilledButton(
              onPressed: () => Navigator.pop(internalCtx, true),
              child: Text('Aceitar'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(internalCtx, false),
              child: Text('Negar'),
            ),
          ],
        ),
      ),
    );

    log('Resposta: $result');

    // if (result is! Task) return;

    // setState(() => tasks.add(result));
  }

  Future<void> navigateToAddTaskPage() async {
    final newTask = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => AddTaskPageForm()));

    if (newTask != null) {
      // ------ FUNCIONA ------
      // tasks.add(newTask);
      // setState(() {});

      // setState(() {});
      // tasks.add(newTask);

      setState(() => tasks.add(newTask));

      // ------ NAO FUNCIONA ------
      // setState(() {});
      // await Future.delayed(Duration(seconds: 1));
      // tasks.add(newTask);
    }
  }
}
