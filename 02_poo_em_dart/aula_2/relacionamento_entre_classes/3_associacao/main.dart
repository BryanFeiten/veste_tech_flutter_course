// > Pessoa     +   Chave

// - -> Utilização
// - -> Momentos eventuais
// X -> Não vou adicionar dentro da outra classe

// Associação: É uma utilização em um momento apenas, sem guardar instância da classe. É a ideia de USO

import 'dart:math';

class Freelancer {
  final String nome = 'freelancer-1';

  void trabalha() {
    print('Trabalhando');
  }

  void emitirBoletoDoServicoPrestado() {
    print('Boleto emitido, valor R\$ ${Random().nextDouble()}');
  }
}

class Empresa {
  void empregarTrabalhador(Freelancer freelancer) {
    freelancer.trabalha();
  }
}

class Caixa {
  void finalizarCompra(CarrinhoDeCompras carrinho) {
    final double valorACobrar = carrinho.total;

    print('Cobrando valor R\$ ${valorACobrar.toStringAsFixed(2)}');
  }
}

class CarrinhoDeCompras {
  final List<Produto> produtos = [];

  double get total => produtos.fold(0.0, (total, p) => total += p.valor);
}

class Produto {
  final double valor;
  final String nome;

  const Produto({required this.nome, required this.valor});
}

void main() {}
