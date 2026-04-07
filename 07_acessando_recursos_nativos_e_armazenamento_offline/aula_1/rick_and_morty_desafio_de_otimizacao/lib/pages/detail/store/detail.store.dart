import 'package:mobx/mobx.dart';

import '../../../models/character_detail.model.dart';
import '../../../services/api.service.dart';

part 'detail.store.g.dart';

class DetailStore = DetailStoreBase with _$DetailStore;

abstract class DetailStoreBase with Store {
  final _apiService = ApiService();

  @observable
  bool isLoading = false;

  @observable
  CharacterDetail? characterDetail;

  @action
  Future<void> loadDetailCharacter(int characterId) async {
    isLoading = true;

    characterDetail =
        await _apiService.getCharacterDetail(characterId: characterId);

    isLoading = false;
  }
}
