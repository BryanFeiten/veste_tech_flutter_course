import 'package:app_desafio/stores/home.store.dart';
import 'package:app_desafio/widgets.modal_content.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = HomeStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App do desafio')),
      body: SafeArea(
        child: Padding(
          padding: const .all(24),
          child: Observer(
            builder: (_) {
              return ListView.builder(
                itemCount: store.exercicios.length,
                itemBuilder: (context, index) {
                  final exercicio = store.exercicios[index];

                  return ListTile(title: Text(exercicio));
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showModal,
        child: Icon(Icons.add),
      ),
    );
  }

  void showModal() async {
    final result = await showModalBottomSheet(
      context: context,
      useSafeArea: false,
      showDragHandle: true,

      builder: (ctx) {
        return ModalContent();
      },
    );

    if (result == null) return;

    final message = store.adicionarNovoExercicio(result);

    if (message == null || !mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
