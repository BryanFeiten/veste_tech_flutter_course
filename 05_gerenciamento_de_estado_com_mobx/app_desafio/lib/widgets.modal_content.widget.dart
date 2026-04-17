import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ModalContent extends StatefulWidget {
  const ModalContent({super.key});

  @override
  State<ModalContent> createState() => _ModalContentState();
}

class _ModalContentState extends State<ModalContent> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final keyboardSize = MediaQuery.of(context).viewInsets.bottom;
    final keyboardSize = MediaQuery.viewInsetsOf(context).bottom;

    return SafeArea(
      child: Padding(
        padding: const .symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .stretch,
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Nome do exercício'),
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: FilledButton(
                onPressed: () => Navigator.pop(context, controller.text.trim()),
                child: Text('Confirmar'),
              ),
            ),
            SizedBox(height: keyboardSize),
          ],
        ),
      ),
    );
  }
}
