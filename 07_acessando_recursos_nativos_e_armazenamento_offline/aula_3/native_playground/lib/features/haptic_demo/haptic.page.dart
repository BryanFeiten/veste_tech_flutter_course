import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'haptic.store.dart';
import 'usecases/trigger_semantic_haptic_usecase.dart';

class HapticPage extends StatefulWidget {
  const HapticPage({super.key});

  @override
  State<HapticPage> createState() => _HapticPageState();
}

class _HapticPageState extends State<HapticPage> {
  final HapticStore store = HapticStore(
    GetIt.I<TriggerSemanticHapticUseCase>(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback Tátil Semântico')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: store.triggerSuccess,
                child: const Text('Simular Sucesso'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: store.triggerError,
                child: const Text('Simular Erro'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: store.triggerSelection,
                child: const Text('Simular Seleção'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
