import '../adapters/secure_storage.adapter.dart';

/// Serviço responsável por recuperar um token de autenticação
/// armazenado de forma segura no armazenamento local.
class GetSecureTokenLocalService {
  final ISecureStorageAdapter _secureStorage;

  GetSecureTokenLocalService(this._secureStorage);

  /// Retorna o token de autenticação salvo ou null se não existir.
  Future<String?> call() async {
    return await _secureStorage.read(key: 'auth_token');
  }
}
