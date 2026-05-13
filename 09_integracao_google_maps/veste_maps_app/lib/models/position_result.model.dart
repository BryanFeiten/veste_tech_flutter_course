import 'package:geolocator/geolocator.dart';

class PositionResult {
  final Position? position;
  final LocationPermission? permission;
  final bool hasSuccess;

  const PositionResult.success(Position this.position)
    : permission = null,
      hasSuccess = true;
  const PositionResult.failure(LocationPermission this.permission)
    : position = null,
      hasSuccess = false;

  @override
  String toString() =>
      'PositionResult(position: $position, permission: $permission, hasSuccess: $hasSuccess)';
}
