import 'package:desafio_final_5/pages/home/home.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CartPage extends StatelessWidget {
  // final HomeStore store;

  CartPage({super.key});
  // const CartPage({super.key, required this.store});

  final store = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEE600), // Mercado Livre Yellow
        elevation: 0,
        leading: BackButton(
          key: const Key("backBtn"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Carrinho de compras",
          style: TextStyle(color: Colors.black87),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Observer(
        builder: (_) {
          if (store.cart.isEmpty) {
            return Center(
              child: Image.asset(
                'assets/empty_cart.png',
                key: const Key("imageCart"),
                width: 200,
                fit: BoxFit.contain,
              ),
            );
          }

          return ListView.builder(
            itemCount: store.cart.length,
            itemBuilder: (context, index) {
              final item = store.cart[index];
              return ListTile(
                title: Text(
                  '$index - ${item.name} - ${item.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
