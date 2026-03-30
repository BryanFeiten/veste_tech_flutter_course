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
