import '../services/get_secure_token.service.dart';
import '../services/save_secure_token.service.dart';

/// Repositório que orquestra os serviços de token seguro.
class SecureTokenRepository {
  final SaveSecureTokenLocalService _saveToken;
  final GetSecureTokenLocalService _getToken;

  SecureTokenRepository({
    required SaveSecureTokenLocalService saveToken,
    required GetSecureTokenLocalService getToken,
  })  : _saveToken = saveToken,
        _getToken = getToken;

  /// Salva o token de autenticação.
  Future<void> saveToken(String token) => _saveToken(token);

  /// Recupera o token de autenticação salvo.
  Future<String?> getToken() => _getToken();
}
