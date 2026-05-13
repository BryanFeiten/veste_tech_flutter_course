// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:veste_maps_app/models/position_result.model.dart';

part 'geolocator.store.g.dart';

// ignore: library_private_types_in_public_api
class GeolocatorStore = _GeolocatorStoreBase with _$GeolocatorStore;

abstract class _GeolocatorStoreBase with Store {
  @observable
  bool _isOn = false;
  bool get isOn => _isOn;

  StreamSubscription? _subStatus;

  _GeolocatorStoreBase() {
    _init();
  }

  void _init() {
    _subStatus = Geolocator.getServiceStatusStream().listen(_handleStatus);
  }

  void dispose() {
    unawaited(_subStatus?.cancel());
    _subStatus = null;
  }

  void _handleStatus(ServiceStatus status) {
    _isOn = switch (status) {
      .enabled => true,
      .disabled => false,
    };
  }

  Future<LocationPermission> _askPermission() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return permission;
  }

  @action
  Future<PositionResult?> getUserPosition(
    void Function() onDeniedForever,
  ) async {
    final permissionResult = await _askPermission();
    final allowPermission = <LocationPermission>[
      .whileInUse,
      .always,
    ].contains(permissionResult);

    if (!allowPermission) return PositionResult.failure(permissionResult);

    final position = await Geolocator.getCurrentPosition();
    return PositionResult.success(position);
  }
}
