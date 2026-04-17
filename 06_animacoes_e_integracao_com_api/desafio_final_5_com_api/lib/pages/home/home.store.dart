import 'dart:convert';

import 'package:desafio_final_5/models/product.model.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

part 'home.store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final httpClient = Dio();

  _HomeStoreBase() {
    loadProducts();
  }

  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @observable
  ObservableList<Product> _products = ObservableList();
  List<Product> get products => _products;

  @observable
  ObservableList<Product> _cart = ObservableList();
  List<Product> get cart => _cart;

  @computed
  int get cartQuantity => _cart.length;

  @action
  // Adiciona produto no carrinho
  bool addToCart(Product p) {
    final hasSameProduct = _cart.any((product) => product.id == p.id);
    if (hasSameProduct) return false;

    _cart.add(p);
    return true;
  }

  @action
  // Carrega produtos
  Future<void> loadProducts() async {
    _isLoading = true;

    final rawResult = await httpClient.get(
      'https://gist.githubusercontent.com/BryanFeiten/e73d99e6f0abdac870a3345be5221d19/raw/58539cb3c4fc8441ad4069456160ef518d36846d/products.json',
    );
    final result = jsonDecode(rawResult.data);

    final listaBruta = result['data'] as List;

    final produtosIteraveis = listaBruta.map((item) => Product.fromMap(item));

    // print(result.data);

    // await Future.delayed(Duration(seconds: 2));

    // final List<Product> newProducts = [];
    // for (int i = 0; i < 15; i++) {
    //   newProducts.add(
    //     Product(
    //       id: i,
    //       name: 'Apple Iphone 11 Pro (128gb) Preto',
    //       price: 599.99 + (i * 600) - (0.01 * i),
    //       rating: i == 2 ? 1.0 : 5.0,
    //       imageUrl: 'assets/iphone.png',
    //     ),
    //   );
    // }
    _products = ObservableList.of(produtosIteraveis);

    _isLoading = false;
  }
}
