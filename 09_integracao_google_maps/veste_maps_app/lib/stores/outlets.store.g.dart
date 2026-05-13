// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlets.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OutletsStore on _OutletsStoreBase, Store {
  Computed<OutletStoreState>? _$stateComputed;

  @override
  OutletStoreState get state => (_$stateComputed ??= Computed<OutletStoreState>(
    () => super.state,
    name: '_OutletsStoreBase.state',
  )).value;

  late final _$_stateAtom = Atom(
    name: '_OutletsStoreBase._state',
    context: context,
  );

  @override
  OutletStoreState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(OutletStoreState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$_fetchOutletsAsyncAction = AsyncAction(
    '_OutletsStoreBase._fetchOutlets',
    context: context,
  );

  @override
  Future<bool> _fetchOutlets() {
    return _$_fetchOutletsAsyncAction.run(() => super._fetchOutlets());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
