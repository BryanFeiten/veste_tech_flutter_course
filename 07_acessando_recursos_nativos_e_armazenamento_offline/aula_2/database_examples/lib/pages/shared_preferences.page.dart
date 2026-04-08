import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../adapters/shared_prefs.adapter.dart';
import '../services/get_user_name.service.dart';
import '../services/save_user_name.service.dart';
import '../stores/user_prefs.store.dart';

/// Página de exemplo com Shared Preferences
class SharedPreferencesPage extends StatefulWidget {
  const SharedPreferencesPage({super.key});

  @override
  State<SharedPreferencesPage> createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  late final UserPrefsStore _store;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // final adapter = OtherSharedPreferencesAdapter();
    // final adapter = SharedPrefsAsyncAdapter();
    final adapter = SharedPrefsAdapter();

    /// Removemos para dimminuir a complexidade do primeiro exemplo
    // final repository = UserPrefsRepository(
    //   saveUserName: SaveUserNameLocalService(adapter),
    //   getUserName: GetUserNameLocalService(adapter),
    // );

    _store = UserPrefsStore(
      // repository
      saveUserNameService: SaveUserNameLocalService(adapter),
      getUserNameService: GetUserNameLocalService(adapter),
    );
    _store.loadUserName();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSave() async {
    final name = _controller.text.trim();
    if (name.isEmpty) return;
    await _store.setUserName(name);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared Preferences')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nome de Usuário',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _handleSave(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _handleSave, child: const Text('Salvar')),
            const SizedBox(height: 32),
            const Text(
              'Nome salvo:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Observer(
              builder: (_) => Text(
                _store.userName.isNotEmpty
                    ? _store.userName
                    : 'Nenhum nome salvo',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
