import 'package:mobx/mobx.dart';

import '../repositories/user_prefs.repository.dart';

part 'user_prefs.store.g.dart';

/// Store responsável por gerenciar o estado do nome do usuário na tela.
// ignore: library_private_types_in_public_api
class UserPrefsStore = _UserPrefsStore with _$UserPrefsStore;

abstract class _UserPrefsStore with Store {
  _UserPrefsStore(this._repository);

  final UserPrefsRepository _repository;

  @observable
  String _userName = '';
  String get userName => _userName;

  @action
  Future<void> loadUserName() async {
    final name = await _repository.getUserName();
    _userName = name ?? '';
  }

  @action
  Future<void> setUserName(String name) async {
    await _repository.saveUserName(name);
    _userName = name;
  }
}
