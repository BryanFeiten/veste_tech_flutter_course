import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

// 1. A Interface puramente Semântica (UX)
abstract class IHapticAdapter {
  Future<void> feedbackSuccess();
  Future<void> feedbackError();
  Future<void> feedbackWarning();
  Future<void> feedbackSelection();
}

// 2. O Adapter (O Mapeamento Físico)
class HapticAdapter implements IHapticAdapter {
  @override
  Future<void> feedbackSelection() async {
    // Toque curtíssimo
    await Vibration.vibrate(duration: 30, amplitude: 64);
  }

  @override
  Future<void> feedbackSuccess() async {
    // Toque amigável e suave
    await Vibration.vibrate(duration: 50, amplitude: 128);
  }

  @override
  Future<void> feedbackError() async {
    // Aqui entra a cadência que o motor não faz sozinho!
    // Padrão: espera 0ms, vibra 150ms, pausa 50ms, vibra 200ms
    await Vibration.vibrate(
      pattern: [0, 150, 50, 200],
      intensities: [0, 255, 0, 255],
    );
  }

  @override
  Future<void> feedbackWarning() async {
    // Alerta: Médio seguido de leve
    await Vibration.vibrate(
      pattern: [0, 100, 50, 50],
      intensities: [0, 192, 0, 128],
    );
  }
}

class NativeHapticAdapter implements IHapticAdapter {
  @override
  Future<void> feedbackSelection() async =>
      await HapticFeedback.selectionClick();

  @override
  Future<void> feedbackSuccess() async => await HapticFeedback.lightImpact();

  @override
  Future<void> feedbackWarning() async {
    await HapticFeedback.mediumImpact();
    await Future.delayed(const Duration(milliseconds: 100));
    await HapticFeedback.lightImpact();
  }

  @override
  Future<void> feedbackError() async {
    await HapticFeedback.heavyImpact();
    await Future.delayed(const Duration(milliseconds: 150));
    await HapticFeedback.heavyImpact();
  }
}
