import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/models/api_response.model.dart';

import '../models/character_detail.model.dart';

class ApiService {
  late final Dio _uno;

  ApiService() {
    _uno = Dio(
      BaseOptions(
        baseUrl: "https://rickandmortyapi.com/api",
        validateStatus: (_) => true,
      ),
    );
  }

  Future<ApiResponse> getListCharacters({required int page}) async {
    final response = await _uno.get("/character?page=$page");

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar os dados");
    }

    return ApiResponse.fromMap(response.data);
  }

  Future<CharacterDetail> getCharacterDetail({required int characterId}) async {
    final response = await _uno.get("/character/$characterId");

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar os dados");
    }

    return CharacterDetail.fromMap(response.data);
  }
}
