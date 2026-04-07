import '../adapters/shared_prefs.adapter.dart';

/// Serviço responsável por ler o nome do usuário do armazenamento local.
class GetUserNameLocalService {
  final ILocalStorageAdapter _storage;

  GetUserNameLocalService(this._storage);

  /// Retorna o nome salvo do usuário ou null se não existir.
  Future<String?> call() async {
    return await _storage.read('user_name');
  }
}
