import 'package:first_app/pages/twitter_page.dart';
import 'package:flutter/material.dart';

/// Ponto de entrada do Aplicativo em si (o ponto de entrada do código fica em "main.dart")
///
/// Alguns apps optam por ter isso dentro do "main.dart" mesmo

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp -> Android
    // CupertinoApp -> iOS
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const TwitterPage(),
    );
  }
}
