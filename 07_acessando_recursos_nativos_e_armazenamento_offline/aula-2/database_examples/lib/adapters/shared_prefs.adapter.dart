import 'package:shared_preferences/shared_preferences.dart';

/// Interface para operações de armazenamento local simples de texto.
/// Oculta os detalhes de implementação do pacote de armazenamento.
abstract interface class ILocalStorageAdapter {
  /// Salva um [value] associado a uma [key] no armazenamento local.
  Future<void> save(String key, String value);

  /// Lê o valor associado a [key]. Retorna null se a chave não existir.
  Future<String?> read(String key);

  /// Remove o valor associado a [key].
  Future<void> remove(String key);

  /// Limpa todos os dados do armazenamento local.
  Future<void> clear();
}

/// Implementação concreta que utiliza o Shared Preferences.
class SharedPrefsAdapter implements ILocalStorageAdapter {
  late SharedPreferences _prefs;

  Future<SharedPreferences> get instance async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  @override
  Future<void> save(String key, String value) async {
    await instance;
    await _prefs.setString(key, value);
  }

  @override
  Future<String?> read(String key) async {
    await instance;
    return _prefs.getString(key);
  }

  @override
  Future<void> remove(String key) async {
    await instance;
    await _prefs.remove(key);
  }

  @override
  Future<void> clear() async {
    await instance;
    await _prefs.clear();
  }
}
