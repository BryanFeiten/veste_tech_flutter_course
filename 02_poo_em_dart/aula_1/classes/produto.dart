// Classe (Molde pra evitar erros de escrita, declaração, ou até mesmo de uso)
class Produto {
  final String nome;
  final int quantidade;
  final double valor;

  const Produto({
    required this.nome,
    required this.quantidade,
    required this.valor,
  });

  void lerProduto() {
    print('Esse produto é uma maçã');
  }
}

// ---- Spoiler da próxima call --- START

// class CarrinhoDeProdutos {
//   final List<Produto> produtos = [];
// }

// class Carro {
//   final Motor motor;

//   Carro() : motor = Motor();
// }

// class Motor {}

// ---- Spoiler da próxima call --- END

// // Classe (Molde pra evitar erros de escrita, declaração, ou até mesmo de uso)
// class CarroLocadora {
//   final String marca;
//   final int ano;
//   final int qtdeDePortas;
// }

// class CarroMecanica {
//   final String marca;
//   final int ano;
// }

class ProdutoDetalhado {
  final String nome;
  final int quantidade;
  final double valor;
  final DateTime validade;
  final bool contemGlutem;
  final String lote;
  final String codigoDeBarras;
  final DateTime dataDeFabricacao;

  const ProdutoDetalhado({
    required this.nome,
    required this.quantidade,
    required this.valor,
    required this.validade,
    required this.contemGlutem,
    required this.lote,
    required this.codigoDeBarras,
    required this.dataDeFabricacao,
  });

  void lerProduto() {
    print('Esse produto é uma maçã');
  }
}

void main() {
  final maca = Produto(nome: 'Maçã', quantidade: 12, valor: 8.99);
}
