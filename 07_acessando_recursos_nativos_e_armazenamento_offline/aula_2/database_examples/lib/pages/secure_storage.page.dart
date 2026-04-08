import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../injection_container.dart';
import '../stores/secure_token.store.dart';

/// Página de exemplo com Secure Storage para persistência de Auth Token.
class SecureStoragePage extends StatelessWidget {
  SecureStoragePage({super.key});

  final store = SecureTokenStore(
    getTokenService: getIt(),
    saveTokenService: getIt(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Secure Storage')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Token',
                hintText: 'Digite o token para salvar',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.key_outlined),
              ),
              onChanged: store.setTokenInput,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Observer(
                    builder: (_) => ElevatedButton.icon(
                      onPressed: store.isLoading ? null : store.saveToken,
                      icon: store.isLoading
                          ? const SizedBox.square(
                              dimension: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.save_outlined),
                      label: const Text('Salvar'),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Observer(
                    builder: (_) => ElevatedButton.icon(
                      onPressed: store.isLoading ? null : store.retrieveToken,
                      icon: store.isLoading
                          ? const SizedBox.square(
                              dimension: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.folder_open_outlined),
                      label: const Text('Ler'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (store.message.isNotEmpty)
              Observer(
                builder: (_) => Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: store.message.contains('Erro')
                        ? Colors.red.shade50
                        : Colors.green.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: store.message.contains('Erro')
                          ? Colors.red.shade200
                          : Colors.green.shade200,
                    ),
                  ),
                  child: Text(
                    store.message,
                    style: TextStyle(
                      color: store.message.contains('Erro')
                          ? Colors.red.shade800
                          : Colors.green.shade800,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Observer(
              builder: (_) => Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Token armazenado:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      store.retrievedToken.isEmpty
                          ? 'Nenhum token lido'
                          : store.retrievedToken,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 13,
                        color: store.retrievedToken.isEmpty
                            ? Colors.grey
                            : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
