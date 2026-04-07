import '../adapters/shared_prefs.adapter.dart';

/// Serviço responsável por salvar o nome do usuário no armazenamento local.
class SaveUserNameLocalService {
  final ILocalStorageAdapter _storage;

  SaveUserNameLocalService(this._storage);

  /// Salva o [name] no armazenamento com a chave definida internamente.
  Future<void> call(String name) async {
    await _storage.save('user_name', name);
  }
}
