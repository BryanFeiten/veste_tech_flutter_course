import 'package:flutter/material.dart';
import 'package:database_examples/pages/shared_preferences.page.dart';
import 'package:database_examples/stores/contact.store.dart';
import 'package:database_examples/stores/task.store.dart';
import 'package:database_examples/pages/secure_storage.page.dart';
import 'package:database_examples/pages/sqflite.page.dart';
import 'package:database_examples/pages/task.page.dart';
import 'package:database_examples/injection_container.dart';

/// Página principal com lista de exemplos de bancos de dados
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final examples = [
      _Example(
        title: 'Shared Preferences',
        subtitle: 'Armazenamento simples de chave-valor',
        page: const SharedPreferencesPage(),
        icon: Icons.memory_outlined,
        color: Colors.blue,
      ),
      _Example(
        title: 'Hive',
        subtitle: 'Lista de tarefas com banco NoSQL',
        page: TaskPage(taskStore: TaskStore(getIt())),
        icon: Icons.hub_outlined,
        color: Colors.amber,
      ),
      _Example(
        title: 'Secure Storage',
        subtitle: 'Armazenamento seguro para dados sensíveis',
        page: const SecureStoragePage(),
        icon: Icons.lock_outline,
        color: Colors.green,
      ),
      _Example(
        title: 'SQLite',
        subtitle: 'Banco de dados relacional local',
        page: SqflitePage(contactStore: ContactStore(getIt())),
        icon: Icons.storage_outlined,
        color: Colors.purple,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplos de Banco de Dados'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: examples.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final example = examples[index];
          return _ExampleCard(
            title: example.title,
            subtitle: example.subtitle,
            icon: example.icon,
            color: example.color,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => example.page),
            ),
          );
        },
      ),
    );
  }
}

class _Example {
  final String title;
  final String subtitle;
  final Widget page;
  final IconData icon;
  final Color color;

  _Example({
    required this.title,
    required this.subtitle,
    required this.page,
    required this.icon,
    required this.color,
  });
}

class _ExampleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ExampleCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: color, size: 36),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
      ),
    );
  }
}
