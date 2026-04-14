import 'usecases/trigger_semantic_haptic_usecase.dart';

class HapticStore {
  final TriggerSemanticHapticUseCase _useCase;

  HapticStore(this._useCase);

  Future<void> triggerFeedback(HapticIntent intent) async {
    await _useCase.call(intent);
  }
}
