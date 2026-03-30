import '../classes/produto.dart';

abstract class MetodoDePagamento {
  void pagar(double valorParaPagar);
}

class Pix implements MetodoDePagamento {
  @override
  void pagar(double valorParaPagar) {
    print('Pagando R\$ ${valorParaPagar} com o PIX');
  }
}

class CartaoDeDebito implements MetodoDePagamento {
  @override
  void pagar(double valorParaPagar) {
    print('Pagando R\$ ${valorParaPagar} com o Cartão de Débito');
  }
}

class Caixa {
  void finalizarCompra(List<Produto> produtos, MetodoDePagamento metodoDePgto) {
    // final valorFinal = produtos.fold(
    //   0.0,
    //   (total, p) => total += (p.valor * p.quantidade),
    // );

    double valorFinal = 0.0;

    for (final produto in produtos) {
      valorFinal += produto.valor * produto.quantidade;
    }

    metodoDePgto.pagar(double.parse(valorFinal.toStringAsFixed(2)));
  }
}

void main() {
  final pix = Pix();
  final cartaoDebito = CartaoDeDebito();
  // final metodoGenerico = MetodoDePagamento();

  final List<Produto> produtos = [
    Produto(nome: 'Maçã', quantidade: 12, valor: 9.9),
  ];

  final caixa = Caixa();

  caixa.finalizarCompra(produtos, cartaoDebito);
}
