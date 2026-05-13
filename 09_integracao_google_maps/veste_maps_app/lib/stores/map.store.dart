import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:veste_maps_app/stores/geolocator.store.dart';
import 'package:veste_maps_app/stores/outlets.store.dart';

part 'map.store.g.dart';

// ignore: library_private_types_in_public_api
class MapStore = _MapStoreBase with _$MapStore;

// Store utilizando composição para manter os domínios separados e testáveis (futuramente)
abstract class _MapStoreBase with Store {
  final OutletsStore _outletStore;
  final GeolocatorStore geolocatorStore;

  _MapStoreBase({
    required OutletsStore outletStore,
    required this.geolocatorStore,
  }) : _outletStore = outletStore;

  @observable
  bool _isLoadingMap = true;
  bool get isLoadingMap => _isLoadingMap;

  @computed
  Set<Marker>? get markers {
    if (_outletStore.state case SuccessOutletsState(:final outlets)) {
      return Set.from(
        outlets.map(
          (outlet) => Marker(
            markerId: MarkerId(outlet.id.toString()),
            position: LatLng(outlet.lat, outlet.lon),
          ),
        ),
      );
    }
    return null;
  }

  @observable
  late GoogleMapController _mapController;
  GoogleMapController get mapController => _mapController;

  @action
  void fillState(GoogleMapController controller) {
    _mapController = controller;
    _isLoadingMap = false;
  }
}
