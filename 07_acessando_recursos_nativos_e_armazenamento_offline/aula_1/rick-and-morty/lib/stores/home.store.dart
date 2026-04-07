// ignore_for_file: prefer_final_fields

import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/services/get_all_characters.service.dart';

part 'home.store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final GetAllCharactersService service;

  _HomeStoreBase(this.service);

  int _page = 1;

  @observable
  String _searchText = '';
  @action
  void writeSearchText(String text) => _searchText = text.trim();
  @computed
  List<Character> get filteredCharacters {
    if (_searchText.isEmpty) return _characters;

    final intSearchText = int.tryParse(_searchText);

    return _characters
        .where((c) => c.name.contains(_searchText) || c.id == intSearchText)
        .toList();
  }

  @observable
  bool _isOnGridView = true;
  bool get isOnGridView => _isOnGridView;
  @action
  void toggleViewMode() => _isOnGridView = !_isOnGridView;

  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @observable
  ObservableList<Character> _characters = ObservableList();
  List<Character> get characters => _characters;

  @observable
  bool _hasNextPage = false;
  bool get hasNextPage => _hasNextPage;

  @action
  Future<void> loadCharacters() async {
    if (_isLoading || !_hasNextPage) return;

    _isLoading = true;

    final result = await service.call(_page);

    _isLoading = false;

    if (result.hasError) return;

    _page++;
    _hasNextPage = result.hasNextPage;
    _characters.addAll(result.characters);
  }

  @action
  void updateCharacterColor(int id, {required Color color}) {
    final indexCharacter = characters.indexWhere(
      (character) => character.id == id,
    );

    if (indexCharacter == -1) return;

    _characters[indexCharacter] = _characters[indexCharacter].copyWith(
      newColor: color,
    );
  }
}
