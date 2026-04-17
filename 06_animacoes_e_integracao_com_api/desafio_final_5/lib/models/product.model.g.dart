// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Product on ProductBase, Store {
  late final _$ratingAtom = Atom(name: 'ProductBase.rating', context: context);

  @override
  double get rating {
    _$ratingAtom.reportRead();
    return super.rating;
  }

  @override
  set rating(double value) {
    _$ratingAtom.reportWrite(value, super.rating, () {
      super.rating = value;
    });
  }

  @override
  String toString() {
    return '''
rating: ${rating}
    ''';
  }
}
