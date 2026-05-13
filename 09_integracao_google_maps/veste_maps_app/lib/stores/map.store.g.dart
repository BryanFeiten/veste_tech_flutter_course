// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapStore on _MapStoreBase, Store {
  Computed<Set<Marker>?>? _$markersComputed;

  @override
  Set<Marker>? get markers => (_$markersComputed ??= Computed<Set<Marker>?>(
    () => super.markers,
    name: '_MapStoreBase.markers',
  )).value;

  late final _$_isLoadingMapAtom = Atom(
    name: '_MapStoreBase._isLoadingMap',
    context: context,
  );

  @override
  bool get _isLoadingMap {
    _$_isLoadingMapAtom.reportRead();
    return super._isLoadingMap;
  }

  @override
  set _isLoadingMap(bool value) {
    _$_isLoadingMapAtom.reportWrite(value, super._isLoadingMap, () {
      super._isLoadingMap = value;
    });
  }

  late final _$_mapControllerAtom = Atom(
    name: '_MapStoreBase._mapController',
    context: context,
  );

  @override
  GoogleMapController get _mapController {
    _$_mapControllerAtom.reportRead();
    return super._mapController;
  }

  bool __mapControllerIsInitialized = false;

  @override
  set _mapController(GoogleMapController value) {
    _$_mapControllerAtom.reportWrite(
      value,
      __mapControllerIsInitialized ? super._mapController : null,
      () {
        super._mapController = value;
        __mapControllerIsInitialized = true;
      },
    );
  }

  late final _$_MapStoreBaseActionController = ActionController(
    name: '_MapStoreBase',
    context: context,
  );

  @override
  void fillState(GoogleMapController controller) {
    final _$actionInfo = _$_MapStoreBaseActionController.startAction(
      name: '_MapStoreBase.fillState',
    );
    try {
      return super.fillState(controller);
    } finally {
      _$_MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
markers: ${markers}
    ''';
  }
}
