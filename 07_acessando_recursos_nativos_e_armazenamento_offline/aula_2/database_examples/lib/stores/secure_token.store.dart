import 'package:database_examples/services/get_secure_token.service.dart';
import 'package:database_examples/services/save_secure_token.service.dart';
import 'package:mobx/mobx.dart';

part 'secure_token.store.g.dart';

/// Store responsável por gerenciar o estado do token de autenticação.
// ignore: library_private_types_in_public_api
class SecureTokenStore = _SecureTokenStore with _$SecureTokenStore;

abstract class _SecureTokenStore with Store {
  // _SecureTokenStore(this._repository);

  // final SecureTokenRepository _repository;

  _SecureTokenStore({
    required SaveSecureTokenLocalService saveTokenService,
    required GetSecureTokenLocalService getTokenService,
  }) : _saveTokenService = saveTokenService,
       _getTokenService = getTokenService;

  final SaveSecureTokenLocalService _saveTokenService;
  final GetSecureTokenLocalService _getTokenService;

  /// Token digitado no campo de entrada – acesso via getter.
  @observable
  String _tokenInput = '';
  String get tokenInput => _tokenInput;

  /// Token recuperado do armazenamento seguro – acesso via getter.
  @observable
  String _retrievedToken = '';
  String get retrievedToken => _retrievedToken;

  /// Controla se há uma operação em andamento.
  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// Mensagem de feedback da última operação.
  @observable
  String _message = '';
  String get message => _message;

  /// Salva o token informado no armazenamento seguro.
  @action
  Future<void> saveToken() async {
    if (_tokenInput.trim().isEmpty) {
      _message = 'Digite um token para salvar';
      return;
    }
    _isLoading = true;
    _message = '';
    try {
      await _saveTokenService(_tokenInput.trim());
      _message = 'Token salvo com sucesso!';
      _tokenInput = '';
    } catch (e) {
      _message = 'Erro ao salvar o token';
    } finally {
      _isLoading = false;
    }
  }

  /// Recupera o token do armazenamento seguro.
  @action
  Future<void> retrieveToken() async {
    _isLoading = true;
    _message = '';
    try {
      final token = await _getTokenService();
      _retrievedToken = token ?? 'Nenhum token encontrado';
      _message = token != null ? 'Token recuperado!' : 'Nenhum token salvo';
    } catch (e) {
      _message = 'Erro ao recuperar o token';
      _retrievedToken = '';
    } finally {
      _isLoading = false;
    }
  }

  /// Atualiza o valor do campo de entrada.
  @action
  void setTokenInput(String value) {
    _tokenInput = value;
  }
}
