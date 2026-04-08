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
    // Com essa implementação, ele puxa pra memória RAM
    _prefs = await SharedPreferences.getInstance();

    /// Exemplo de implementação para usar assíncrono, sem carregar todo arquivo xml na memória RAM
    // final preferencesAsync = SharedPreferencesAsync();
    // final randomString = await preferencesAsync.getString('chave-qualquer');

    return _prefs;
  }

  @override
  Future<void> save(String key, String value) async {
    await instance;
    await _prefs.setString(key, value);
    // _prefs.setBool(key, value);
    // _prefs.setDouble(key, value);
    // _prefs.setInt(key, value);
    // _prefs.setStringList(key, value);

    /// {
    ///   "user-theme": "dark"
    ///   "onboarding-was-done": false,
    /// }
  }

  // /// Localização
  // /// loc-
  // ///
  // /// Exemplo de como buscar todas localizações (objeto imaginario só para exemplo). Essa lógica é apenas exemplo. Ela seria implementada num service geralmente
  // Future<List<String>> filterByStartsWith(String startsWith) async {
  //   await instance;
  //   final allKeys = _prefs.getKeys();

  //   // return allKeys.where((k) => k.startsWith(startWithKey)).toList();
  //   final filteredKeys = allKeys
  //       .where((k) => k.startsWith(startsWith))
  //       .toList();

  //   final List<String> filteredItems = [];

  //   for (final filteredKey in filteredKeys) {
  //     final filteredItem = _prefs.getString(filteredKey);
  //     if (filteredItem == null) continue;

  //     filteredItems.add(filteredItem);
  //   }

  //   return filteredItems;
  // }

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

class SharedPrefsAsyncAdapter implements ILocalStorageAdapter {
  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();

  @override
  Future<void> save(String key, String value) async {
    await _prefs.setString(key, value);
  }

  @override
  Future<String?> read(String key) async => await _prefs.getString(key);

  @override
  Future<void> remove(String key) async => await _prefs.remove(key);

  @override
  Future<void> clear() async => await _prefs.clear();
}

// class OtherSharedPreferencesAdapter implements ILocalStorageAdapter {
//   @override
//   Future<void> clear() {
//     // TODO: implement clear
//     throw UnimplementedError();
//   }

//   @override
//   Future<String?> read(String key) {
//     // TODO: implement read
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> remove(String key) {
//     // TODO: implement remove
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> save(String key, String value) {
//     // TODO: implement save
//     throw UnimplementedError();
//   }
// }
