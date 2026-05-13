import 'package:veste_maps_app/models/failure.model.dart';

class ApiResult<T> {
  final T? data;
  final Failure? failure;
  final bool hasSuccess;

  const ApiResult.success(T this.data) : failure = null, hasSuccess = true;
  const ApiResult.failure(Failure this.failure)
    : data = null,
      hasSuccess = false;
}
