import 'package:mobx/mobx.dart';

part 'product.model.g.dart';

class Product = ProductBase with _$Product;

abstract class ProductBase with Store {
  final int id;
  final String name;
  final double price;

  @observable
  double rating;

  ProductBase({
    required this.id,
    required this.name,
    required this.price,
    this.rating = 0.0,
  });
}
