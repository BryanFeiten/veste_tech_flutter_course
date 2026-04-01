import 'package:rick_and_morty/models/character.model.dart';

class CharactersResponse {
  final bool hasNextPage;
  final List<Character> characters;
  final bool hasError;

  const CharactersResponse._success({
    required this.hasNextPage,
    required this.characters,
  }) : hasError = false;

  const CharactersResponse._failure()
    : hasError = true,
      characters = const [],
      hasNextPage = false;

  factory CharactersResponse.fromMap(Map<String, dynamic> map) {
    // if (map case {'info': Map info, 'results': List results}) {
    //   final hasNextPage = info['next'] != null;
    //   final characters = results.map((e) => Character.fromMap(e)).toList();

    //   return CharactersResponse._success(
    //     hasNextPage: hasNextPage,
    //     characters: characters,
    //   );
    // }

    if (map['info'] is! Map || map['results'] is! List) {
      return CharactersResponse._failure();
    }

    final hasNextPage = map['info']['next'] != null;
    final characters = (map['results'] as List)
        .map((e) => Character.fromMap(e))
        .toList();

    return CharactersResponse._success(
      hasNextPage: hasNextPage,
      characters: characters,
    );
  }
}
