import 'package:flutter/material.dart';

import 'config/service_locator.dart' as sl;

void main() async {
  // Inicializa o gerenciador de injeção de dependências (GetIt)
  sl.main();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
