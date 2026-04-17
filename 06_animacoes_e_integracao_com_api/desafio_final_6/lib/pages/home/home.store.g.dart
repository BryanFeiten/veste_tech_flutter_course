// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<List<Character>>? _$filteredCharactersComputed;

  @override
  List<Character> get filteredCharacters =>
      (_$filteredCharactersComputed ??= Computed<List<Character>>(
        () => super.filteredCharacters,
        name: 'HomeStoreBase.filteredCharacters',
      )).value;

  late final _$charactersAtom = Atom(
    name: 'HomeStoreBase.characters',
    context: context,
  );

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$currentPageAtom = Atom(
    name: 'HomeStoreBase.currentPage',
    context: context,
  );

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: 'HomeStoreBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$hasMoreAtom = Atom(
    name: 'HomeStoreBase.hasMore',
    context: context,
  );

  @override
  bool get hasMore {
    _$hasMoreAtom.reportRead();
    return super.hasMore;
  }

  @override
  set hasMore(bool value) {
    _$hasMoreAtom.reportWrite(value, super.hasMore, () {
      super.hasMore = value;
    });
  }

  late final _$searchQueryAtom = Atom(
    name: 'HomeStoreBase.searchQuery',
    context: context,
  );

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$isGridAtom = Atom(
    name: 'HomeStoreBase.isGrid',
    context: context,
  );

  @override
  bool get isGrid {
    _$isGridAtom.reportRead();
    return super.isGrid;
  }

  @override
  set isGrid(bool value) {
    _$isGridAtom.reportWrite(value, super.isGrid, () {
      super.isGrid = value;
    });
  }

  late final _$fetchCharactersAsyncAction = AsyncAction(
    'HomeStoreBase.fetchCharacters',
    context: context,
  );

  @override
  Future<void> fetchCharacters({bool isInitial = false}) {
    return _$fetchCharactersAsyncAction.run(
      () => super.fetchCharacters(isInitial: isInitial),
    );
  }

  late final _$HomeStoreBaseActionController = ActionController(
    name: 'HomeStoreBase',
    context: context,
  );

  @override
  void setSearchQuery(String query) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.setSearchQuery',
    );
    try {
      return super.setSearchQuery(query);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleViewMode() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.toggleViewMode',
    );
    try {
      return super.toggleViewMode();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
characters: ${characters},
currentPage: ${currentPage},
isLoading: ${isLoading},
hasMore: ${hasMore},
searchQuery: ${searchQuery},
isGrid: ${isGrid},
filteredCharacters: ${filteredCharacters}
    ''';
  }
}
