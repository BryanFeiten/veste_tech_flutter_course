// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geolocator.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GeolocatorStore on _GeolocatorStoreBase, Store {
  late final _$_isOnAtom = Atom(
    name: '_GeolocatorStoreBase._isOn',
    context: context,
  );

  @override
  bool get _isOn {
    _$_isOnAtom.reportRead();
    return super._isOn;
  }

  @override
  set _isOn(bool value) {
    _$_isOnAtom.reportWrite(value, super._isOn, () {
      super._isOn = value;
    });
  }

  late final _$getUserPositionAsyncAction = AsyncAction(
    '_GeolocatorStoreBase.getUserPosition',
    context: context,
  );

  @override
  Future<PositionResult?> getUserPosition(void Function() onDeniedForever) {
    return _$getUserPositionAsyncAction.run(
      () => super.getUserPosition(onDeniedForever),
    );
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
