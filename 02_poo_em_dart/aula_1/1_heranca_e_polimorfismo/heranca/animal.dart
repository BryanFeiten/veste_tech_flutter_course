class Animal {
  final String nome;
  final String especie;
  final String? coberturaCorporal;

  // Exemplo de construtor primário
  const Animal({
    required this.nome,
    required this.especie,
    required this.coberturaCorporal,
  });

  // Exemplo de construtor nomeado
  const Animal.coberturaCorporalObrigatoria({
    required this.nome,
    required this.especie,
    required String this.coberturaCorporal,
  });

  void emitirSom() {
    print('Som genérico');
  }

  /// ### Descrição do método:
  /// - Parâmetro [distancia] é passado em metros
  /// - Esse método recebe [distancia] que é a quantidade que o animal vai andar, em **metros**
  ///
  void andar(int distancia) {
    print('Andou ${distancia} metros');
  }
}

class Pato extends Animal {
  // Exemplo de construtor primário passando parâmetros via super
  const Pato({required String nome})
    : super(nome: nome, especie: 'Pato', coberturaCorporal: null);
}

void criarPato() {
  final pato = Pato(nome: 'Tio Patinhas');

  print('pato: $pato');
}

class Chimpanze extends Animal {
  const Chimpanze({required String nome, required String especie})
    : super(nome: nome, especie: especie, coberturaCorporal: 'Pelos');
}
