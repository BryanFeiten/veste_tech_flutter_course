import 'api_info.model.dart';
import 'character.model.dart';

class ApiResponse {
  final ApiInfo info;
  final List<Character> results;

  ApiResponse({
    required this.info,
    required this.results,
  });

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      info: ApiInfo.fromMap(map['info'] as Map<String, dynamic>),
      results:
          (map["results"] as List).map((e) => Character.fromMap(e)).toList(),
    );
  }
}
