import 'package:mobx/mobx.dart';

import 'adapters/url_launcher_adapter.dart';

part 'url_launcher.store.g.dart';

// ignore: library_private_types_in_public_api
class UrlLauncherStore = _UrlLauncherStoreBase with _$UrlLauncherStore;

abstract class _UrlLauncherStoreBase with Store {
  final IOpenLinks _adapter = UrlLauncherAdapter();

  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @observable
  String _writedNumber = '';
  @observable
  String _whatsMessage = '';

  @computed
  bool get _hasValidNumber => _writedNumber.length >= 10;
  @computed
  bool get _hasValidText => _whatsMessage.length >= 2;
  @computed
  bool get canOpenWhats => _hasValidNumber && _hasValidText && !_isLoading;

  @action
  void writeNumber(String num) =>
      _writedNumber = num.replaceAll(RegExp(r'\D'), '');

  @action
  void writeWhatsMessage(String msg) => _whatsMessage = msg.trim();

  @action
  Future<void> openUrl(String url) async {
    _isLoading = true;
    try {
      final success = await _adapter.launchUrl(url);
      if (!success) {
        // Aqui poderia haver um tratamento de erro/alerta na UI
      }
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future<void> openWhatsApp() async {
    if (_isLoading) return;

    _isLoading = true;
    try {
      final success = await _adapter.launchWhatsApp(
        '55$_writedNumber',
        message: _whatsMessage,
      );
      if (!success) {
        // Aqui poderia haver um tratamento de erro/alerta na UI
      }
    } finally {
      _isLoading = false;
    }
  }
}
