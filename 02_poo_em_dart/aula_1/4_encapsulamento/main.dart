import '../3_contratos/pagamento.dart';
import 'produto.dart';

void main() {
  final maca = Produto(nome: 'Maçã', quantidade: 12, valor: 8.99);
  maca.alterarValor(1.99);

  final caixa = Caixa();

  caixa.finalizarCompra([maca], Pix());
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
