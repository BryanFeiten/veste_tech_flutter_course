// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardStore on CardStoreBase, Store {
  late final _$dominantColorAtom = Atom(
    name: 'CardStoreBase.dominantColor',
    context: context,
  );

  @override
  Color? get dominantColor {
    _$dominantColorAtom.reportRead();
    return super.dominantColor;
  }

  @override
  set dominantColor(Color? value) {
    _$dominantColorAtom.reportWrite(value, super.dominantColor, () {
      super.dominantColor = value;
    });
  }

  late final _$loadDominantColorAsyncAction = AsyncAction(
    'CardStoreBase.loadDominantColor',
    context: context,
  );

  @override
  Future<void> loadDominantColor(String imageUrl) {
    return _$loadDominantColorAsyncAction.run(
      () => super.loadDominantColor(imageUrl),
    );
  }

  @override
  String toString() {
    return '''
dominantColor: ${dominantColor}
    ''';
  }
}
