import 'package:flutter/material.dart';
import 'package:lista_de_compras/pages/lista_de_compras.page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      // home: HomePage(),
      home: ListaDeCompras(),
    );
  }
}
