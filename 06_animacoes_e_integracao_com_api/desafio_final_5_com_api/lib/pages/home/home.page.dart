import 'package:desafio_final_5/pages/cart/cart.page.dart';
import 'package:desafio_final_5/pages/home/home.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStore store;

  @override
  void initState() {
    super.initState();

    store = HomeStore();
    GetIt.I.registerSingleton(store);
  }

  @override
  void dispose() {
    GetIt.I.unregister<HomeStore>();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEE600), // Mercado Livre Yellow
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TextField(
              key: Key("inputSearch"),
              decoration: InputDecoration(
                hintText: 'Buscar no Mercado Livre',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Observer(
              builder: (_) => Badge(
                label: Text('${store.cartQuantity}'),
                isLabelVisible: store.cartQuantity > 0,
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black87,
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartPage()),
                // MaterialPageRoute(builder: (_) => CartPage(store: store)),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              // CEP Header
              Container(
                color: const Color(0xFFFEE600),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.pin_drop_outlined,
                      size: 16,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Informe o seu cep',
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),

              // Results and Filter
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${store.products.length} resultados',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: const [
                        Text(
                          'Filtrar (2)',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.blue,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Product List
              Expanded(
                child: RefreshIndicator(
                  onRefresh: store.loadProducts,
                  child: ListView.separated(
                    itemCount: store.products.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (_, index) {
                      final product = store.products[index];
                      return Container(
                        key: const Key("productItem"),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                product.image.url,
                                key: const Key("productImage"),
                                width: 100,
                                height: 100,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'R\$ ${product.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'em 10x R\$ ${(product.price / 10).toStringAsFixed(2)} sem juros',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.green,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Frete grátis',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'Disponível em 6 cores',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  RatingBar.builder(
                                    initialRating: product.rating,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 16,
                                    itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 1.0,
                                    ),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.blue,
                                    ),
                                    onRatingUpdate: (rating) {
                                      product.rating = rating;
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  ElevatedButton(
                                    key: const Key("addProductToCart"),
                                    onPressed: () {
                                      final added = store.addToCart(product);
                                      ScaffoldMessenger.of(
                                        context,
                                      ).hideCurrentSnackBar();
                                      if (added) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Produto adicionado!',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            backgroundColor: Colors.yellow,
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Produto não adicionado!',
                                            ),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      minimumSize: const Size.fromHeight(36),
                                    ),
                                    child: const Text('Add carrinho'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
