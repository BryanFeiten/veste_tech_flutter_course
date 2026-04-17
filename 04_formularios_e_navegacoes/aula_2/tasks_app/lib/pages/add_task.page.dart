import 'package:flutter/material.dart';
import 'package:tasks_app/models/task.model.dart';
import 'package:tasks_app/pages/widgets/custom_input.widget.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  bool isImportant = false;
  bool withDescription = false;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando nova tarefa')),
      body: SafeArea(
        child: Padding(
          padding: .all(10),
          child: Column(
            mainAxisSize: .min,
            children: [
              // Row(
              //   mainAxisAlignment: .spaceBetween,
              //   children: [
              //     Text('Adicionar tarefa'),
              //     CloseButton(onPressed: () => Navigator.pop(context, null)),
              //   ],
              // ),
              // Divider(),
              CustomInput(
                hint: 'O que você quer fazer hoje?',
                controller: titleController,
              ),
              if (withDescription)
                CustomInput(
                  hint: 'Adicionar informações',
                  controller: descriptionController,
                ),
              Row(
                children: [
                  IconButton(
                    icon: withDescription
                        ? const Icon(Icons.sort, color: Colors.indigo)
                        : const Icon(Icons.sort),
                    onPressed: () =>
                        setState(() => withDescription = !withDescription),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: isImportant
                        ? const Icon(Icons.star, color: Colors.indigo)
                        : const Icon(Icons.star_border),
                    onPressed: () => setState(() => isImportant = !isImportant),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      final title = titleController.text;
                      final description = descriptionController.text;

                      if (title.isEmpty) {
                        Navigator.pop(context);
                        return;
                      }

                      final newTask = Task(
                        title: title,
                        description: description,
                        important: isImportant,
                      );

                      Navigator.pop(context, newTask);
                    },
                    child: Text('Adicionar'),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.viewInsetsOf(context).bottom),
            ],
          ),
        ),
      ),
    );
  }
}
