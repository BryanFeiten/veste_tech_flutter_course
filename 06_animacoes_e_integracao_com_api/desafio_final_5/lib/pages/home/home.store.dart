import 'package:desafio_final_5/models/product.model.dart';
import 'package:mobx/mobx.dart';

part 'home.store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
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

    await Future.delayed(Duration(seconds: 2));

    final List<Product> newProducts = [];
    for (int i = 0; i < 15; i++) {
      newProducts.add(
        Product(
          id: i,
          name: 'Apple Iphone 11 Pro (128gb) Preto',
          price: 599.99 + (i * 600) - (0.01 * i),
          rating: i == 2 ? 1.0 : 5.0,
          imagePath: 'assets/iphone.png',
        ),
      );
    }
    _products = ObservableList.of(newProducts);

    _isLoading = false;
  }
}
