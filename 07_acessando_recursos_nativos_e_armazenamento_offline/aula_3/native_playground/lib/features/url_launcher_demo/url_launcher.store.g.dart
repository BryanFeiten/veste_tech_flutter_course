// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_launcher.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UrlLauncherStore on _UrlLauncherStoreBase, Store {
  Computed<bool>? _$_hasValidNumberComputed;

  @override
  bool get _hasValidNumber => (_$_hasValidNumberComputed ??= Computed<bool>(
    () => super._hasValidNumber,
    name: '_UrlLauncherStoreBase._hasValidNumber',
  )).value;
  Computed<bool>? _$_hasValidTextComputed;

  @override
  bool get _hasValidText => (_$_hasValidTextComputed ??= Computed<bool>(
    () => super._hasValidText,
    name: '_UrlLauncherStoreBase._hasValidText',
  )).value;
  Computed<bool>? _$canOpenWhatsComputed;

  @override
  bool get canOpenWhats => (_$canOpenWhatsComputed ??= Computed<bool>(
    () => super.canOpenWhats,
    name: '_UrlLauncherStoreBase.canOpenWhats',
  )).value;

  late final _$_isLoadingAtom = Atom(
    name: '_UrlLauncherStoreBase._isLoading',
    context: context,
  );

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_writedNumberAtom = Atom(
    name: '_UrlLauncherStoreBase._writedNumber',
    context: context,
  );

  @override
  String get _writedNumber {
    _$_writedNumberAtom.reportRead();
    return super._writedNumber;
  }

  @override
  set _writedNumber(String value) {
    _$_writedNumberAtom.reportWrite(value, super._writedNumber, () {
      super._writedNumber = value;
    });
  }

  late final _$_whatsMessageAtom = Atom(
    name: '_UrlLauncherStoreBase._whatsMessage',
    context: context,
  );

  @override
  String get _whatsMessage {
    _$_whatsMessageAtom.reportRead();
    return super._whatsMessage;
  }

  @override
  set _whatsMessage(String value) {
    _$_whatsMessageAtom.reportWrite(value, super._whatsMessage, () {
      super._whatsMessage = value;
    });
  }

  late final _$openUrlAsyncAction = AsyncAction(
    '_UrlLauncherStoreBase.openUrl',
    context: context,
  );

  @override
  Future<void> openUrl(String url) {
    return _$openUrlAsyncAction.run(() => super.openUrl(url));
  }

  late final _$openWhatsAppAsyncAction = AsyncAction(
    '_UrlLauncherStoreBase.openWhatsApp',
    context: context,
  );

  @override
  Future<void> openWhatsApp() {
    return _$openWhatsAppAsyncAction.run(() => super.openWhatsApp());
  }

  late final _$_UrlLauncherStoreBaseActionController = ActionController(
    name: '_UrlLauncherStoreBase',
    context: context,
  );

  @override
  void writeNumber(String num) {
    final _$actionInfo = _$_UrlLauncherStoreBaseActionController.startAction(
      name: '_UrlLauncherStoreBase.writeNumber',
    );
    try {
      return super.writeNumber(num);
    } finally {
      _$_UrlLauncherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void writeWhatsMessage(String msg) {
    final _$actionInfo = _$_UrlLauncherStoreBaseActionController.startAction(
      name: '_UrlLauncherStoreBase.writeWhatsMessage',
    );
    try {
      return super.writeWhatsMessage(msg);
    } finally {
      _$_UrlLauncherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
canOpenWhats: ${canOpenWhats}
    ''';
  }
}
