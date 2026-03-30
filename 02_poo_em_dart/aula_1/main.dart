void main() {
  print('test');
}

class Animal {
  final String _id;

  const Animal._(this._id);

  void emitirSom() {
    print('Emitir som genérico');
  }
}

class Passaro extends Animal {
  const Passaro(String id) : super._(id);

  void imprimirId() {
    print(this._id);
  }

  @override
  void emitirSom() {
    print('piu piu');
  }
}
