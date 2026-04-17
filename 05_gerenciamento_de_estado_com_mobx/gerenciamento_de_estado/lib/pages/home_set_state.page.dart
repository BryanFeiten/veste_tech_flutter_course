import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gerenciamento_de_estado/widgets/texto_fixo.widget.dart';

class HomeSetStatePage extends StatefulWidget {
  const HomeSetStatePage({super.key});

  @override
  State<HomeSetStatePage> createState() => _HomeSetStatePageState();
}

class _HomeSetStatePageState extends State<HomeSetStatePage> {
  int counter = 0;

  void increment() {
    setState(() => counter++);
    // log('Contador: $counter');
  }

  @override
  Widget build(BuildContext context) {
    log('Build', name: 'HomePage');

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .all(24),
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                const LinhaFixa(text: 'texto 1'),
                Text(
                  'Contador: $counter',
                  style: TextStyle(fontSize: 24),
                  textAlign: .center,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
