import 'package:flutter/services.dart';

/// Interface para o adaptador de feedback tátil.
/// Garante que a aplicação não dependa diretamente do SDK do Flutter,
/// facilitando testes unitários e trocas de implementação.
abstract class IHapticAdapter {
  void lightImpact();
  void mediumImpact();
  void heavyImpact();
  void vibrate();
}

/// Implementação concreta do adaptador usando o SDK nativo do Flutter.
class HapticAdapter implements IHapticAdapter {
  @override
  void lightImpact() {
    HapticFeedback.lightImpact();
  }

  @override
  void mediumImpact() {
    HapticFeedback.mediumImpact();
  }

  @override
  void heavyImpact() {
    HapticFeedback.heavyImpact();
  }

  @override
  void vibrate() {
    HapticFeedback.vibrate();
  }
}
