import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/characters_response.model.dart';

class GetAllCharactersService {
  final Dio _dio;

  GetAllCharactersService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://rickandmortyapi.com/api',
          validateStatus: (_) => true,
        ),
      );

  Future<CharactersResponse> call(int page) async {
    final response = await _dio.get('/character/?page=$page');

    return CharactersResponse.fromMap(
      response.data is Map ? response.data : {'error': response.data},
    );
  }
}

// void main() async {
//   final service = GetAllCharactersService();

//   final result = await service.call(3);
//   print(result.characters.length);
// }
