import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Interface para operações de armazenamento seguro.
/// Oculta os detalhes de implementação do pacote flutter_secure_storage.
abstract interface class ISecureStorageAdapter {
  /// Salva um valor [data] associado à [key].
  Future<void> write({required String key, required String data});

  /// Lê o valor associado à [key]. Retorna null se não existir.
  Future<String?> read({required String key});

  /// Remove o valor associado à [key].
  Future<void> delete({required String key});

  /// Remove todos os valores armazenados.
  Future<void> deleteAll();
}

/// Implementação concreta que utiliza o FlutterSecureStorage
/// para armazenamento seguro de dados sensíveis.
class SecureStorageAdapter implements ISecureStorageAdapter {
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  @override
  Future<void> write({required String key, required String data}) async {
    await _storage.write(key: key, value: data);
  }

  @override
  Future<String?> read({required String key}) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }

  @override
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
