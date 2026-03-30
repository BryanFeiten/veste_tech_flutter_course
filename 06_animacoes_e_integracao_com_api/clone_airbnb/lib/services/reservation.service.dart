import 'package:clone_airbnb/adapters/http_client.adapter.dart';
import 'package:clone_airbnb/config/service_locator.dart' as sl;
import 'package:clone_airbnb/models/reservation.model.dart';
import 'package:get_it/get_it.dart';

class ReservationService {
  final IHttpClientAdapter _httpClient;

  const ReservationService(this._httpClient);

  Future<List<Reservation>?> getAllReservations() async {
    final rawResult = await _httpClient.get('/reservations');
    final result = rawResult.data['result'];

    if (rawResult.statusCode != 200) return null;

    final models = (result as List).map((e) => Reservation.fromMap(e)).toList();

    print(models);
    return models;
  }
}

void main() async {
  sl.main();

  final adapter = ApiAdapter(GetIt.I());

  final service = ReservationService(adapter);

  await service.getAllReservations();
}
