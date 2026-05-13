import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:veste_maps_app/models/failure.model.dart';
import 'package:veste_maps_app/models/outlet.model.dart';
import 'package:veste_maps_app/services/fetch_outlets.service.dart';

part 'outlets.store.g.dart';

// ignore: library_private_types_in_public_api
class OutletsStore = _OutletsStoreBase with _$OutletsStore;

abstract class _OutletsStoreBase with Store {
  final FetchOutletsService _service;

  _OutletsStoreBase(this._service) {
    unawaited(_fetchOutlets());
  }

  @observable
  OutletStoreState _state = LoadingOutletsState();
  @computed
  OutletStoreState get state => _state;

  Future<bool> fetchOutlets() async {
    // assert(_state is LoadingOutletsState, 'Race condition detectado');
    // if (_state is LoadingOutletsState) return false;

    final result = await _fetchOutlets();
    return result;
  }

  @action
  Future<bool> _fetchOutlets() async {
    _state = LoadingOutletsState();

    final result = await _service();

    if (!result.hasSuccess) {
      _state = FailureOutletsState(result.failure!);
      return false;
    }

    _state = SuccessOutletsState(result.data!);
    return true;
  }
}

sealed class OutletStoreState {}

class LoadingOutletsState extends OutletStoreState {}

class SuccessOutletsState extends OutletStoreState {
  final List<Outlet> outlets;

  SuccessOutletsState(this.outlets);
}

class FailureOutletsState extends OutletStoreState {
  final Failure failure;

  FailureOutletsState(this.failure);
}
