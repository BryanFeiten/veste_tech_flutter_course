// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_prefs.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserPrefsStore on _UserPrefsStore, Store {
  late final _$_userNameAtom = Atom(
    name: '_UserPrefsStore._userName',
    context: context,
  );

  @override
  String get _userName {
    _$_userNameAtom.reportRead();
    return super._userName;
  }

  @override
  set _userName(String value) {
    _$_userNameAtom.reportWrite(value, super._userName, () {
      super._userName = value;
    });
  }

  late final _$loadUserNameAsyncAction = AsyncAction(
    '_UserPrefsStore.loadUserName',
    context: context,
  );

  @override
  Future<void> loadUserName() {
    return _$loadUserNameAsyncAction.run(() => super.loadUserName());
  }

  late final _$setUserNameAsyncAction = AsyncAction(
    '_UserPrefsStore.setUserName',
    context: context,
  );

  @override
  Future<void> setUserName(String name) {
    return _$setUserNameAsyncAction.run(() => super.setUserName(name));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
