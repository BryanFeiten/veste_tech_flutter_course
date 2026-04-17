// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStoreBase, Store {
  late final _$_isCheckingAuthAtom = Atom(
    name: '_AuthStoreBase._isCheckingAuth',
    context: context,
  );

  @override
  bool get _isCheckingAuth {
    _$_isCheckingAuthAtom.reportRead();
    return super._isCheckingAuth;
  }

  @override
  set _isCheckingAuth(bool value) {
    _$_isCheckingAuthAtom.reportWrite(value, super._isCheckingAuth, () {
      super._isCheckingAuth = value;
    });
  }

  late final _$_isUserAuthenticatedAtom = Atom(
    name: '_AuthStoreBase._isUserAuthenticated',
    context: context,
  );

  @override
  bool get _isUserAuthenticated {
    _$_isUserAuthenticatedAtom.reportRead();
    return super._isUserAuthenticated;
  }

  @override
  set _isUserAuthenticated(bool value) {
    _$_isUserAuthenticatedAtom.reportWrite(
      value,
      super._isUserAuthenticated,
      () {
        super._isUserAuthenticated = value;
      },
    );
  }

  late final _$tryAuthenticateAsyncAction = AsyncAction(
    '_AuthStoreBase.tryAuthenticate',
    context: context,
  );

  @override
  Future<void> tryAuthenticate() {
    return _$tryAuthenticateAsyncAction.run(() => super.tryAuthenticate());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
