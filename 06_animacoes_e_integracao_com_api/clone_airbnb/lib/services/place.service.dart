import 'package:clone_airbnb/adapters/http_client.adapter.dart';
import 'package:clone_airbnb/config/service_locator.dart' as sl;
import 'package:clone_airbnb/models/place.model.dart';
import 'package:get_it/get_it.dart';

class PlaceService {
  final IHttpClientAdapter _httpClient;

  const PlaceService(this._httpClient);

  Future<List<Place>?> getAllPlaces() async {
    final rawResult = await _httpClient.get('/places');
    if (rawResult.statusCode != 200) {
      return null;
    }

    final result = rawResult.data['result'];

    final models = (result as List).map((e) => Place.fromMap(e)).toList();
    return models;
  }
}

void main() async {
  sl.main();

  final adapter = ApiAdapter(GetIt.I());

  final service = PlaceService(adapter);

  final result = await service.getAllPlaces();
  print(result);
}
