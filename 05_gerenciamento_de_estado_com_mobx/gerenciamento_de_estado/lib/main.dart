// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:gerenciamento_de_estado/pages/home_set_state.page.dart';
import 'package:gerenciamento_de_estado/pages/home_value_notifier.page.dart';
import 'package:gerenciamento_de_estado/pages/login.page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      home: LoginPage(),
    );
  }
}
