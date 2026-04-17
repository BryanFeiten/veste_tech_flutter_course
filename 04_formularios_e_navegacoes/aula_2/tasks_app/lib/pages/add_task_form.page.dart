import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTaskPageForm extends StatefulWidget {
  const AddTaskPageForm({super.key});

  @override
  State<AddTaskPageForm> createState() => _AddTaskPageFormState();
}

class _AddTaskPageFormState extends State<AddTaskPageForm> {
  final TextEditingController controladorDeTextoDoTitulo =
      TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isImportant = false;
  bool withDescription = false;

  final bool _canCreateTask = false;

  String titleText = '';

  @override
  void initState() {
    super.initState();

    controladorDeTextoDoTitulo.text = 'Texto inicial';

    scheduleMicrotask(() async {
      await Future.delayed(Duration(seconds: 2));
      controladorDeTextoDoTitulo.clear();
    });
  }

  @override
  void dispose() {
    controladorDeTextoDoTitulo.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TextField
    // TextFormField -> validator, onSaved
    // Estilização TextFormField -> Outlined, Border.none
    // Recepção de parâmetros específicos
    // Form -> Com GlobalKey, e chamando o validator, onSaved
    // CheckboxListTile
    // RadioListTile

    // Atividadezinha pra filtrar (trocar por "*****") palavras específicas digitadas

    return Scaffold(
      appBar: AppBar(title: Text('Criando nova tarefa')),
      body: SafeArea(
        child: Padding(
          padding: .all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: .min,
              spacing: 24,
              children: [
                FormField<String>(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    value ??= '';

                    if (value.isEmpty) return 'Valor obrigatório';
                    if (value.length < 3) return 'Mínimo de 3 caracteres';

                    return null;
                  },
                  builder: (formFieldState) {
                    final errorColor = Theme.of(context).colorScheme.error;
                    final borderStyle = OutlineInputBorder(
                      borderSide: formFieldState.hasError
                          ? BorderSide(color: errorColor)
                          : BorderSide(),
                    );

                    return Column(
                      crossAxisAlignment: .start,
                      children: [
                        TextField(
                          onTapOutside: (_) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          decoration: InputDecoration(
                            hintText: 'O que você quer fazer hoje?',
                            // focusedBorder: borderStyle,
                            border: OutlineInputBorder(),
                            errorBorder: borderStyle,
                            // border: InputBorder.none,
                          ),
                          statesController: WidgetStatesController({
                            WidgetState.error,
                          }),
                          onChanged: (value) {
                            titleText = value;
                            formFieldState.didChange(value);
                          },
                          textInputAction: TextInputAction.next,
                        ),
                        if (formFieldState.errorText case String errorText)
                          Padding(
                            padding: .only(left: 14, top: 2),
                            child: Text(
                              errorText,
                              style: TextStyle(color: errorColor, fontSize: 12),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    spacing: 12,
                    children: [
                      TextFormField(
                        onTapOutside: (_) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          value ??= '';

                          if (value.isEmpty) return 'Valor obrigatório';
                          if (value.length < 3) return 'Mínimo de 3 caracteres';

                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'O que você quer fazer hoje?',
                          border: OutlineInputBorder(),
                          // border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          titleText = value;
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      CustomInput(),
                      TextFormField(
                        onTapOutside: (_) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        validator: (value) {
                          value ??= '';

                          if (value.isEmpty) return 'Valor obrigatório';
                          if (value.length < 30) {
                            return 'Mínimo de 30 caracteres';
                          }

                          return null;
                        },
                        // maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Número de telefone',
                          border: OutlineInputBorder(),
                        ),
                        // keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        // keyboardType: TextInputType.multiline,
                        // keyboardType: TextInputType.,
                        // keyboardType: TextInputType.number,
                        // keyboardType: TextInputType.numberWithOptions(),
                      ),
                      // TextFormField(
                      //   onTapOutside: (_) =>
                      //       FocusManager.instance.primaryFocus?.unfocus(),
                      //   validator: (value) {
                      //     value ??= '';

                      //     if (value.isEmpty) return 'Valor obrigatório';
                      //     if (value.length < 30) return 'Mínimo de 30 caracteres';

                      //     return null;
                      //   },
                      //   // maxLines: 5,
                      //   decoration: InputDecoration(
                      //     hintText: 'E-mail',
                      //     border: OutlineInputBorder(),
                      //   ),
                      //   keyboardType: TextInputType.datetime,
                      //   // keyboardType: TextInputType.emailAddress,
                      //   // keyboardType: TextInputType.multiline,
                      //   // keyboardType: TextInputType.number,
                      //   // keyboardType: TextInputType.numberWithOptions(),
                      // ),
                      // FilledButton(
                      //   onPressed: () => showDatePicker(
                      //     context: context,
                      //     firstDate: DateTime.now(),
                      //     lastDate: DateTime.now().add(Duration(days: 365)),
                      //   ),
                      //   child: Text('Escolha a data'),
                      // ),
                    ],
                  ),
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
                      onPressed: () =>
                          setState(() => isImportant = !isImportant),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: titleText.length < 3
                          ? null
                          : () {
                              final formIsValid = _formKey.currentState
                                  ?.validate();
                              log('Formulário é válido: $formIsValid');

                              _formKey.currentState?.save();
                            },
                      // onPressed: _canCreateTask
                      //     ? () {
                      //         // if (controladorDeTextoDoTitulo.text.length > 5) {
                      //         //   // titleController.clear();
                      //         //   controladorDeTextoDoTitulo.text =
                      //         //       controladorDeTextoDoTitulo.text.substring(3);
                      //         // }

                      //         // final title = titleController.text;
                      //         // final description = descriptionController.text;

                      //         // if (title.isEmpty) {
                      //         //   Navigator.pop(context);
                      //         //   return;
                      //         // }

                      //         // final newTask = Task(
                      //         //   title: title,
                      //         //   description: description,
                      //         //   important: isImportant,
                      //         // );

                      //         // Navigator.pop(context, newTask);
                      //       }
                      //     : () {
                      //         final validateResult =
                      //             _formKey.currentState?.validate() ?? false;

                      //         log('Result: $validateResult');

                      //         if (!validateResult) {
                      //           _canCreateTask = false;
                      //         } else {
                      //           _canCreateTask = true;
                      //         }
                      //       },
                      child: Text(_canCreateTask ? 'Adicionar' : 'Verificar'),
                    ),
                  ],
                ),
                // SizedBox(height: MediaQuery.viewInsetsOf(context).bottom),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  final AcceptedKeyboardTypes kbType;

  const CustomInput({this.kbType = .onlyText, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      validator: (value) {
        value ??= '';

        if (value.isEmpty) return 'Valor obrigatório';
        if (value.length < 30) return 'Mínimo de 30 caracteres';

        return null;
      },
      onEditingComplete: () {},
      decoration: InputDecoration(
        hintText: 'Adicionar informações',
        border: OutlineInputBorder(),
      ),
      keyboardType: kbType.toKbType(),
    );
  }
}

enum AcceptedKeyboardTypes {
  digits,
  email,
  onlyText;

  TextInputType toKbType() {
    return switch (this) {
      .digits => TextInputType.number,
      .onlyText => TextInputType.text,
      .email => TextInputType.emailAddress,
    };
  }
}
