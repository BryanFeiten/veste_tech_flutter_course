import 'package:flutter/material.dart';
import 'package:native_playground/core/di/injection.dart';
import 'package:native_playground/home_page.dart';

void main() {
  // Inicializa a injeção de dependências antes de rodar o app
  setupInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Native Playground',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomePage(),
    );
  }
}
