import 'package:flutter/material.dart';

class NotificationTypeDemo extends StatelessWidget {
  final VoidCallback onSimpleNotification;
  final VoidCallback onDataNotification;
  final VoidCallback onImageNotification;

  const NotificationTypeDemo({
    super.key,
    required this.onSimpleNotification,
    required this.onDataNotification,
    required this.onImageNotification,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tipos de Notificações',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Teste diferentes tipos de notificações:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton(
                  onPressed: onSimpleNotification,
                  child: const Text('Simples'),
                ),
                FilledButton(
                  onPressed: onDataNotification,
                  child: const Text('Com Dados'),
                ),
                FilledButton(
                  onPressed: onImageNotification,
                  child: const Text('Com Imagem'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}