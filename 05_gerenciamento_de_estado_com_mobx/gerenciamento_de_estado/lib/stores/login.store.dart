import 'dart:developer';

import 'package:flutter/material.dart';

// Equivalente ao ViewModel
class LoginStore extends ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _hidePassword = true;

  bool _isLoading = false;

  String get email => _email;
  String get password => _password;
  bool get hidePassword => _hidePassword;

  bool get isLoading => _isLoading;

  bool get hasValidData {
    if (_email.length < 5) return false;
    if (!_email.contains('@') || !_email.contains('.com')) return false;

    if (_password.length < 5) return false;

    return true;
  }

  bool get canLogin => hasValidData && !_isLoading;

  void writeEmail(String value) {
    _email = value.trim();
    notifyListeners();
  }

  void writePassword(String value) {
    _password = value.trim();
    notifyListeners();
  }

  void toggleHidPassword() {
    _hidePassword = !_hidePassword;
    notifyListeners();
  }

  Future<bool> doLogin() async {
    if (!hasValidData) return false;

    _hidePassword = true;
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));

    log('Usuário logado com sucesso');

    _isLoading = false;
    notifyListeners();

    return true;
  }
}
