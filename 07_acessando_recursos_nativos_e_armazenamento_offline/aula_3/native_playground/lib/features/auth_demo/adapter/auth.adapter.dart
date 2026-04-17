import 'dart:developer';

import 'package:app_settings/app_settings.dart';
import 'package:local_auth/local_auth.dart';

abstract class IAuthAdapter {
  Future<bool> hasBiometricConfigured();
  Future<bool> authenticateUser();
}

class LocalAuthAdapter implements IAuthAdapter {
  final _instance = LocalAuthentication();

  @override
  Future<bool> hasBiometricConfigured() async {
    final bool canAuthenticate = await _instance.isDeviceSupported();
    if (!canAuthenticate) return false;

    final availableBiometrics = await _instance.getAvailableBiometrics();
    if (availableBiometrics.isEmpty) {
      await AppSettings.openAppSettings(type: .security);
      return false;
    }

    return true;
  }

  @override
  Future<bool> authenticateUser() async {
    final bool userHasBiometricConfigured = await hasBiometricConfigured();
    if (!userHasBiometricConfigured) return false;

    try {
      final result = await _instance.authenticate(
        localizedReason:
            'Para entrar no app, é necessário se autenticar', // biometricOnly: true,
      );

      return result;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
