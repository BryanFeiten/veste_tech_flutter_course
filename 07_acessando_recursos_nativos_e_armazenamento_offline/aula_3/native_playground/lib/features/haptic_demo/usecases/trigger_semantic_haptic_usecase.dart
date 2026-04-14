import '../adapters/haptic_adapter.dart';

/// O UseCase é extremamente magro porque a semântica já está garantida no Adapter.
/// Ele serve como a ponte arquitetural entre a UI e a Infraestrutura.
class TriggerSemanticHapticUseCase {
  final IHapticAdapter _adapter;

  TriggerSemanticHapticUseCase(this._adapter);

  Future<void> call(HapticIntent intent) async {
    switch (intent) {
      case HapticIntent.selection:
        await _adapter.feedbackSelection();
        break;
      case HapticIntent.success:
        await _adapter.feedbackSuccess();
        break;
      case HapticIntent.warning:
        await _adapter.feedbackWarning();
        break;
      case HapticIntent.error:
        await _adapter.feedbackError();
        break;
    }
  }
}

// Enum para mapear a intenção da tela de forma clara
enum HapticIntent { selection, success, warning, error }
