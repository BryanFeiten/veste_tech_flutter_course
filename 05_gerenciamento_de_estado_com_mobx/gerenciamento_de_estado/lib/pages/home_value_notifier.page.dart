import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gerenciamento_de_estado/widgets/texto_fixo.widget.dart';

class HomeValueNotifierPage extends StatefulWidget {
  const HomeValueNotifierPage({super.key});

  @override
  State<HomeValueNotifierPage> createState() => _HomeValueNotifierPageState();
}

class _HomeValueNotifierPageState extends State<HomeValueNotifierPage> {
  final store = CounterStore();

  final ValueNotifier<int> counterNotifier2 = ValueNotifier(0);

  void increment2() {
    counterNotifier2.value++;
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
                ValueListenableBuilder(
                  valueListenable: store.counterNotifier,
                  builder: (context, value, child) {
                    log('ValueListenableBuilder 1');
                    return Text(
                      'Contador: ${store.counterNotifier.value}',
                      style: TextStyle(fontSize: 24),
                      textAlign: .center,
                    );
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: counterNotifier2,
                  builder: (context, value, child) {
                    log('ValueListenableBuilder 2');
                    return Text(
                      'Contador: ${counterNotifier2.value}',
                      style: TextStyle(fontSize: 24),
                      textAlign: .center,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: .end,
        children: [
          FloatingActionButton(
            onPressed: store.increment,
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: increment2,
            child: Icon(Icons.add_a_photo_sharp),
          ),
        ],
      ),
    );
  }
}

// É a ViewModel da arquitetura MVVM (Model View ViewModel)
class CounterStore {
  final ValueNotifier<int> counterNotifier = ValueNotifier(0);

  void increment() {
    counterNotifier.value++;
  }
}

void main() {
  final counterStore = CounterStore();

  counterStore.increment();

  print(counterStore.counterNotifier.value);
}
