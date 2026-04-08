import 'package:database_examples/services/get_user_name.service.dart';
import 'package:database_examples/services/save_user_name.service.dart';
import 'package:mobx/mobx.dart';

part 'user_prefs.store.g.dart';

/// Store responsável por gerenciar o estado do nome do usuário na tela.
// ignore: library_private_types_in_public_api
class UserPrefsStore = _UserPrefsStore with _$UserPrefsStore;

abstract class _UserPrefsStore with Store {
  _UserPrefsStore({
    required SaveUserNameLocalService saveUserNameService,
    required GetUserNameLocalService getUserNameService,
  }) : _saveUserNameService = saveUserNameService,
       _getUserNameService = getUserNameService;

  // final UserPrefsRepository _repository;
  final SaveUserNameLocalService _saveUserNameService;
  final GetUserNameLocalService _getUserNameService;

  @observable
  String _userName = '';
  String get userName => _userName;

  @action
  Future<void> loadUserName() async {
    final name = await _getUserNameService();
    _userName = name ?? '';
  }

  @action
  Future<void> setUserName(String name) async {
    await _saveUserNameService(name);
    _userName = name;
  }
}
