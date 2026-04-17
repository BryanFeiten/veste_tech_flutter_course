import 'package:dio/dio.dart';
import '../core/constants.dart';
import '../models/character.model.dart';

class CharacterRepository {
  final Dio _dio = Dio();

  Future<List<Character>> getCharacters({int page = 1}) async {
    try {
      final response = await _dio.get('${Constants.baseApiUrl}/character', queryParameters: {'page': page});
      if (response.statusCode == 200) {
        final List results = response.data['results'];
        return results.map((json) => Character.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to load characters');
    }
  }
}
