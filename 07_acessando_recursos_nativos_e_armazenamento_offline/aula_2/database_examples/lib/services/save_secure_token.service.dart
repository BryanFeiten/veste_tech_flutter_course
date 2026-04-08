import '../adapters/secure_storage.adapter.dart';

/// Serviço responsável por salvar um token de autenticação
/// de forma segura no armazenamento local.
class SaveSecureTokenLocalService {
  final ISecureStorageAdapter _secureStorage;

  SaveSecureTokenLocalService(this._secureStorage);

  /// Salva o [token] com a chave segura de autenticação.
  Future<void> call(String token) async {
    await _secureStorage.write(key: 'auth_token', data: token);
  }
}
