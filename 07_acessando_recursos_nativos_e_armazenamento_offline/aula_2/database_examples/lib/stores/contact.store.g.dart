// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactStore on _ContactStore, Store {
  late final _$_contactsAtom = Atom(
    name: '_ContactStore._contacts',
    context: context,
  );

  @override
  ObservableList<Contact> get _contacts {
    _$_contactsAtom.reportRead();
    return super._contacts;
  }

  @override
  set _contacts(ObservableList<Contact> value) {
    _$_contactsAtom.reportWrite(value, super._contacts, () {
      super._contacts = value;
    });
  }

  late final _$_isLoadingAtom = Atom(
    name: '_ContactStore._isLoading',
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

  late final _$_newContactNameAtom = Atom(
    name: '_ContactStore._newContactName',
    context: context,
  );

  @override
  String get _newContactName {
    _$_newContactNameAtom.reportRead();
    return super._newContactName;
  }

  @override
  set _newContactName(String value) {
    _$_newContactNameAtom.reportWrite(value, super._newContactName, () {
      super._newContactName = value;
    });
  }

  late final _$_newContactPhoneAtom = Atom(
    name: '_ContactStore._newContactPhone',
    context: context,
  );

  @override
  String get _newContactPhone {
    _$_newContactPhoneAtom.reportRead();
    return super._newContactPhone;
  }

  @override
  set _newContactPhone(String value) {
    _$_newContactPhoneAtom.reportWrite(value, super._newContactPhone, () {
      super._newContactPhone = value;
    });
  }

  late final _$loadContactsAsyncAction = AsyncAction(
    '_ContactStore.loadContacts',
    context: context,
  );

  @override
  Future<void> loadContacts() {
    return _$loadContactsAsyncAction.run(() => super.loadContacts());
  }

  late final _$addContactAsyncAction = AsyncAction(
    '_ContactStore.addContact',
    context: context,
  );

  @override
  Future<void> addContact() {
    return _$addContactAsyncAction.run(() => super.addContact());
  }

  late final _$_ContactStoreActionController = ActionController(
    name: '_ContactStore',
    context: context,
  );

  @override
  void setNewContactName(String value) {
    final _$actionInfo = _$_ContactStoreActionController.startAction(
      name: '_ContactStore.setNewContactName',
    );
    try {
      return super.setNewContactName(value);
    } finally {
      _$_ContactStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewContactPhone(String value) {
    final _$actionInfo = _$_ContactStoreActionController.startAction(
      name: '_ContactStore.setNewContactPhone',
    );
    try {
      return super.setNewContactPhone(value);
    } finally {
      _$_ContactStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
