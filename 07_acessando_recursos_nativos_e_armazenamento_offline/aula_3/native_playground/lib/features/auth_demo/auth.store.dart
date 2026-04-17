import 'package:mobx/mobx.dart';
import 'package:native_playground/features/auth_demo/adapter/auth.adapter.dart';

part 'auth.store.g.dart';

// ignore: library_private_types_in_public_api
class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final IAuthAdapter _authAdapter;

  _AuthStoreBase(this._authAdapter);

  @observable
  bool _isCheckingAuth = false;
  bool get isCheckingAuth => _isCheckingAuth;

  @observable
  bool _isUserAuthenticated = false;
  bool get isUserAuthenticated => _isUserAuthenticated;

  // Future<bool> checkAvailableBiometrics() async {

  // }

  @action
  Future<void> tryAuthenticate() async {
    if (_isCheckingAuth) return;
    _isCheckingAuth = true;

    final result = await _authAdapter.authenticateUser();

    _isUserAuthenticated = result;
    _isCheckingAuth = false;
  }
}
