import 'package:mobx/mobx.dart';

part 'product.model.g.dart';

class Product = ProductBase with _$Product;

abstract class ProductBase with Store {
  final int id;
  final String name;
  final double price;
  final String imagePath;

  @observable
  double rating;

  void changeRating(double newRating) {
    rating = newRating;
  }

  ProductBase({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    this.rating = 0.0,
  });
}
