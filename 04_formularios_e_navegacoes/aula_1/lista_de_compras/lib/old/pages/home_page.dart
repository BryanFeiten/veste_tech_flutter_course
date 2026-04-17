import 'package:flutter/material.dart';
import 'package:lista_de_compras/old/classes/task.dart';
import 'package:lista_de_compras/old/pages/create_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => mostrarModalDeCriarTarefa(context),
        child: Icon(Icons.add),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            spacing: 24,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(alignment: .center, child: Text('Essa é a Página Home')),
              ListView.builder(
                shrinkWrap: true,
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];

                  return ListTile(
                    title: Text(task.title),
                    subtitle: Text(task.description),
                  );
                },
              ),
              FilledButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CreateTaskPage();
                    },
                  ),
                ),
                child: Text('Criar usuário'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void mostrarModalDeCriarTarefa(BuildContext context) async {
    final newTask = await showModalBottomSheet<Task?>(
      context: context,
      enableDrag: true,
      isDismissible: true,
      useSafeArea: false,
      isScrollControlled: true,
      builder: (_) {
        return const BottomSheet();
      },
    );

    if (newTask == null) return;

    setState(() {
      tasks.add(newTask);
    });
  }
}

class BottomSheet extends StatefulWidget {
  const BottomSheet({super.key});

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 24,
        left: 24,
        right: 24,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        spacing: 24,
        children: [
          Align(
            alignment: .center,
            child: Text(
              'Adicionando nova tarefa',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nome da tarefa',
            ),
            onChanged: (value) => text = value,
          ),
          FilledButton(
            onPressed: () => Navigator.pop(
              context,
              text.isEmpty
                  ? null
                  : Task(title: text, description: 'Description: $text'),
            ),
            child: Text('Criar tarefa'),
          ),
        ],
      ),
    );
  }
}
