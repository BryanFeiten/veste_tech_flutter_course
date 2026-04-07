import '../services/save_user_name.service.dart';
import '../services/get_user_name.service.dart';

/// Repositório que orquestra os serviços de preferências do usuário.
class UserPrefsRepository {
  final SaveUserNameLocalService _saveUserName;
  final GetUserNameLocalService _getUserName;

  UserPrefsRepository({
    required SaveUserNameLocalService saveUserName,
    required GetUserNameLocalService getUserName,
  })  : _saveUserName = saveUserName,
        _getUserName = getUserName;

  /// Salva o nome do usuário.
  Future<void> saveUserName(String name) => _saveUserName(name);

  /// Retorna o nome salvo do usuário.
  Future<String?> getUserName() => _getUserName();
}
