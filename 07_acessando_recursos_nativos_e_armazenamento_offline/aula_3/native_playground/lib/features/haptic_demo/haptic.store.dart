import 'usecases/trigger_semantic_haptic_usecase.dart';

class HapticStore {
  final TriggerSemanticHapticUseCase _useCase;

  HapticStore(this._useCase);

  void triggerSuccess() {
    _useCase.executeSuccess();
  }

  void triggerError() {
    _useCase.executeError();
  }

  void triggerSelection() {
    _useCase.executeSelection();
  }
}
