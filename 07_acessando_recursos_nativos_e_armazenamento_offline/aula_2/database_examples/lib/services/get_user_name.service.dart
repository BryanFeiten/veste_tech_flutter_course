import '../adapters/shared_prefs.adapter.dart';

/// Serviço responsável por ler o nome do usuário do armazenamento local.
class GetUserNameLocalService {
  final ILocalStorageAdapter _storage;

  const GetUserNameLocalService(this._storage);

  /// Retorna o nome salvo do usuário ou null se não existir.
  Future<String?> call() async {
    return await _storage.read('user_name');
  }
}

/// Page: Representação do estado da Store
/// 
/// Store: Represetação do estado dos dados
/// Usecase: Tem/Valida as regras de negócio
/// 
/// 
/// Repository: Quem gerencia se busca local, busca remoto, ou entrega o que já tem
/// 
/// Service: Quem "guarda" a Ação de Negócio
/// 
/// Adapter: Quem protege nosso app ao utilizar pacotes terceiros (precisa ser modular o suficiente para permitir uma troca fácil entre pacotes com o mesmo domínio (por exemplo: SharedPreferencesAsync, SharedPreferencesSync, FlutterSecureStorage))
