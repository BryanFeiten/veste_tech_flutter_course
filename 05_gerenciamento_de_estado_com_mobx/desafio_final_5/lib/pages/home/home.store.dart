import 'package:mobx/mobx.dart';
import '../../models/product.model.dart';

part 'home.store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  bool isLoading = true;

  @observable
  ObservableList<Product> products = ObservableList<Product>();

  @observable
  ObservableList<Product> cart = ObservableList<Product>();

  @computed
  int get cartQuantity => cart.length;

  @action
  Future<void> loadProducts() async {
    isLoading = true;
    
    // Simulate 2 seconds loading
    await Future.delayed(const Duration(seconds: 2));

    final newProducts = <Product>[];
    for (int i = 0; i < 15; i++) {
      newProducts.add(Product(
        id: i,
        name: 'Apple Iphone 11 Pro (128gb) - Preto',
        price: 599.99 + (i * 600.00) - (0.01 * i), // 599.99, 1199.98, 1799.97, ...
        rating: i == 2 ? 1.0 : 5.0, // Mock initial ratings based on mockups
      ));
    }
    
    products = ObservableList.of(newProducts);
    isLoading = false;
  }

  @action
  bool addToCart(Product product) {
    if (cart.any((p) => p.id == product.id)) {
      return false; // Already in cart
    }
    cart.add(product);
    return true; // Added successfully
  }
}
