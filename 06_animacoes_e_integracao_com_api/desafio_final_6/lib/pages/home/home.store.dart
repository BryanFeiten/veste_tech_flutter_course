import 'package:mobx/mobx.dart';
import '../../models/character.model.dart';
import '../../repositories/character.repository.dart';

part 'home.store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final CharacterRepository _repository = CharacterRepository();

  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @observable
  int currentPage = 1;

  @observable
  bool isLoading = false;

  @observable
  bool hasMore = true;

  @observable
  String searchQuery = '';

  @observable
  bool isGrid = false;

  @computed
  List<Character> get filteredCharacters {
    if (searchQuery.isEmpty) return characters;
    return characters.where((c) {
      final query = searchQuery.toLowerCase();
      return c.name.toLowerCase().contains(query) || c.id.toString() == query;
    }).toList();
  }

  @action
  Future<void> fetchCharacters({bool isInitial = false}) async {
    if (isLoading || !hasMore) return;
    
    isLoading = true;
    try {
      if (isInitial) {
        currentPage = 1;
        characters.clear();
        hasMore = true;
      }
      
      final newCharacters = await _repository.getCharacters(page: currentPage);
      if (newCharacters.isEmpty || newCharacters.length < 20) {
        hasMore = false;
      }
      characters.addAll(newCharacters);
      currentPage++;
    } catch (e) {
      // Handle error
    } finally {
      isLoading = false;
    }
  }

  @action
  void setSearchQuery(String query) {
    searchQuery = query;
  }

  @action
  void toggleViewMode() {
    isGrid = !isGrid;
  }
}
