// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<List<Character>>? _$filteredCharactersComputed;

  @override
  List<Character> get filteredCharacters =>
      (_$filteredCharactersComputed ??= Computed<List<Character>>(
        () => super.filteredCharacters,
        name: '_HomeStoreBase.filteredCharacters',
      )).value;

  late final _$_searchTextAtom = Atom(
    name: '_HomeStoreBase._searchText',
    context: context,
  );

  @override
  String get _searchText {
    _$_searchTextAtom.reportRead();
    return super._searchText;
  }

  @override
  set _searchText(String value) {
    _$_searchTextAtom.reportWrite(value, super._searchText, () {
      super._searchText = value;
    });
  }

  late final _$_isOnGridViewAtom = Atom(
    name: '_HomeStoreBase._isOnGridView',
    context: context,
  );

  @override
  bool get _isOnGridView {
    _$_isOnGridViewAtom.reportRead();
    return super._isOnGridView;
  }

  @override
  set _isOnGridView(bool value) {
    _$_isOnGridViewAtom.reportWrite(value, super._isOnGridView, () {
      super._isOnGridView = value;
    });
  }

  late final _$_isLoadingAtom = Atom(
    name: '_HomeStoreBase._isLoading',
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

  late final _$_charactersAtom = Atom(
    name: '_HomeStoreBase._characters',
    context: context,
  );

  @override
  ObservableList<Character> get _characters {
    _$_charactersAtom.reportRead();
    return super._characters;
  }

  @override
  set _characters(ObservableList<Character> value) {
    _$_charactersAtom.reportWrite(value, super._characters, () {
      super._characters = value;
    });
  }

  late final _$_hasNextPageAtom = Atom(
    name: '_HomeStoreBase._hasNextPage',
    context: context,
  );

  @override
  bool get _hasNextPage {
    _$_hasNextPageAtom.reportRead();
    return super._hasNextPage;
  }

  @override
  set _hasNextPage(bool value) {
    _$_hasNextPageAtom.reportWrite(value, super._hasNextPage, () {
      super._hasNextPage = value;
    });
  }

  late final _$loadCharactersAsyncAction = AsyncAction(
    '_HomeStoreBase.loadCharacters',
    context: context,
  );

  @override
  Future<void> loadCharacters() {
    return _$loadCharactersAsyncAction.run(() => super.loadCharacters());
  }

  late final _$_HomeStoreBaseActionController = ActionController(
    name: '_HomeStoreBase',
    context: context,
  );

  @override
  void writeSearchText(String text) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
      name: '_HomeStoreBase.writeSearchText',
    );
    try {
      return super.writeSearchText(text);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleViewMode() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
      name: '_HomeStoreBase.toggleViewMode',
    );
    try {
      return super.toggleViewMode();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCharacterColor(int id, {required Color color}) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
      name: '_HomeStoreBase.updateCharacterColor',
    );
    try {
      return super.updateCharacterColor(id, color: color);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filteredCharacters: ${filteredCharacters}
    ''';
  }
}
