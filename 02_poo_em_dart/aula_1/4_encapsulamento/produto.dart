// Classe (Molde pra evitar erros de escrita, declaração, ou até mesmo de uso)
class Produto {
  String _nome;
  int _quantidade;
  int get quantidade => _quantidade;

  double _valor;
  double get valor => _valor;
  String get valorTratado => _valor.toStringAsFixed(2);

  void alterarValor(double novoValor) {
    if (novoValor <= 0) {
      print('O novoValor deve ser positivo');
      return;
    }

    // Regras de validação

    if (novoValor <= _valor * 0.3) {
      print(
        'O novoValor não pode ser inferior a 30% do valor atual (${_valor * 0.3})',
      );
      return;
    }
    // Regras de negócio

    _valor = novoValor;
  }

  Produto({
    required String nome,
    required int quantidade,
    required double valor,
  }) : _nome = nome,
       _quantidade = quantidade,
       _valor = valor;

  void lerProduto() {
    print('Esse produto é uma maçã');
  }
}

// class HomePage {
//   Widget build() {
//     return Column(
//       children: [
//         HeaderHomePage(),
//         Section1HomePage(),
//         Section2HomePage(),
//         FooterHomePage(),
//       ],
//     );
//   }
// }

// class HeaderHomePage {}

// class FooterHomePage {}

// class Section1HomePage {}

// class Section2HomePage {}
