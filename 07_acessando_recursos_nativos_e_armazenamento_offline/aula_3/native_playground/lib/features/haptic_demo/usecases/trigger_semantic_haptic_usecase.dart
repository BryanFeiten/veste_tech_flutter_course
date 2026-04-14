import '../adapters/haptic_adapter.dart';

/// Caso de uso responsável por ditar a semântica de UX do feedback tátil.
/// Esta classe traduz eventos de negócio/interface em estímulos físicos,
/// garantindo consistência e acessibilidade em toda a aplicação.
class TriggerSemanticHapticUseCase {
  final IHapticAdapter _adapter;

  TriggerSemanticHapticUseCase(this._adapter);

  /// Dispara um feedback de sucesso.
  /// Justificativa UX: O 'heavyImpact' fornece uma sensação de confirmação
  /// robusta, indicando que uma ação importante foi concluída com êxito.
  void executeSuccess() {
    _adapter.heavyImpact();
  }

  /// Dispara um feedback de erro.
  /// Justificativa UX: O 'vibrate' é o estímulo mais perceptível e disruptivo,
  /// ideal para alertar o usuário sobre erros críticos ou ações proibidas,
  /// servindo como um aviso tátil imediato.
  void executeError() {
    _adapter.vibrate();
  }

  /// Dispara um feedback de seleção/interação leve.
  /// Justificativa UX: O 'lightImpact' é sutil e não intrusivo,
  /// simulando a sensação de um clique físico real, ideal para navegação
  /// e seleções simples sem sobrecarregar o sentido tátil do usuário.
  void executeSelection() {
    _adapter.lightImpact();
  }
}
