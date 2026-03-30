import 'produto.dart';

class ProdutoAlimenticio extends Produto {
  ProdutoAlimenticio({
    required String nome,
    required int quantidade,
    required double valor,
  }) : super(nome: nome, quantidade: quantidade, valor: valor);

  void alterarValorDoProduto(double novoValor) => super.alterarValor(novoValor);
}
