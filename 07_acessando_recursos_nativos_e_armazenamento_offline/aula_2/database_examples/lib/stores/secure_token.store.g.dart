// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secure_token.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SecureTokenStore on _SecureTokenStore, Store {
  late final _$_tokenInputAtom = Atom(
    name: '_SecureTokenStore._tokenInput',
    context: context,
  );

  @override
  String get _tokenInput {
    _$_tokenInputAtom.reportRead();
    return super._tokenInput;
  }

  @override
  set _tokenInput(String value) {
    _$_tokenInputAtom.reportWrite(value, super._tokenInput, () {
      super._tokenInput = value;
    });
  }

  late final _$_retrievedTokenAtom = Atom(
    name: '_SecureTokenStore._retrievedToken',
    context: context,
  );

  @override
  String get _retrievedToken {
    _$_retrievedTokenAtom.reportRead();
    return super._retrievedToken;
  }

  @override
  set _retrievedToken(String value) {
    _$_retrievedTokenAtom.reportWrite(value, super._retrievedToken, () {
      super._retrievedToken = value;
    });
  }

  late final _$_isLoadingAtom = Atom(
    name: '_SecureTokenStore._isLoading',
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

  late final _$_messageAtom = Atom(
    name: '_SecureTokenStore._message',
    context: context,
  );

  @override
  String get _message {
    _$_messageAtom.reportRead();
    return super._message;
  }

  @override
  set _message(String value) {
    _$_messageAtom.reportWrite(value, super._message, () {
      super._message = value;
    });
  }

  late final _$saveTokenAsyncAction = AsyncAction(
    '_SecureTokenStore.saveToken',
    context: context,
  );

  @override
  Future<void> saveToken() {
    return _$saveTokenAsyncAction.run(() => super.saveToken());
  }

  late final _$retrieveTokenAsyncAction = AsyncAction(
    '_SecureTokenStore.retrieveToken',
    context: context,
  );

  @override
  Future<void> retrieveToken() {
    return _$retrieveTokenAsyncAction.run(() => super.retrieveToken());
  }

  late final _$_SecureTokenStoreActionController = ActionController(
    name: '_SecureTokenStore',
    context: context,
  );

  @override
  void setTokenInput(String value) {
    final _$actionInfo = _$_SecureTokenStoreActionController.startAction(
      name: '_SecureTokenStore.setTokenInput',
    );
    try {
      return super.setTokenInput(value);
    } finally {
      _$_SecureTokenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
