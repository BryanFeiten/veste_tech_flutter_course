## Controle de Estado

### 1. Statefull com uso do setState

### 2. ValueNotifier com ValueListenableBuilder

### 3. ChangeNotifier com o ValueListanable

### 4. Observable (Mobx) com o Observer


[Internos]
- setState
- ValueNotifier (extende de ChangeNotifier)
- ChangeNotifier
- ~~InhertedWidget~~
[Externos]
-> Mobx
- Signals
- GetX
- Bloc (Stream)
- Riverpod
- Provider

```dart
import 'package:mobx/mobx.dart';

class CounterStore {
  // 1. OBSERVABLE: O estado reativo. 
  // Precisamos instanciar a classe Observable explicitamente. Parecido com o ValueNotifier
  final Observable<int> _count = Observable<int>(0);

  // Getter para expor apenas o valor (protegendo o dado)
  int get count => _count.value;

  // 2. ACTION: A ação que altera o estado.
  // Declaramos como 'late' para inicializar no construtor.
  late final Action increment;

  void _increment() {
      _count.value++;
  }

  CounterStore() {
    increment = Action(_increment);
  }
}
```