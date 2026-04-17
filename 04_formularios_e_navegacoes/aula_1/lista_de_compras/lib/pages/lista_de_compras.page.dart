import 'package:flutter/material.dart';
import 'package:lista_de_compras/classes/produto.entity.dart';

class ListaDeCompras extends StatefulWidget {
  const ListaDeCompras({super.key});

  @override
  State<ListaDeCompras> createState() => _ListaDeComprasState();
}

class _ListaDeComprasState extends State<ListaDeCompras> {
  final List<Produto> produtos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Compras'), centerTitle: true),
      // backgroundColor: Colors.blue.shade100,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: produtos.length,
                itemBuilder: (context, index) {
                  final produto = produtos[index];
                  return ListTile(
                    title: Text(produto.nome),
                    subtitle: Text(produto.preco.toString()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
