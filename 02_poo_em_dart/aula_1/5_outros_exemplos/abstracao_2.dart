class Produto {
  String descricao;
  double valor;
  double taxaImposto;
  String codigoDeBarras;

  Produto({
    required this.descricao,
    required this.valor,
    required this.taxaImposto,
    required this.codigoDeBarras,
  });
}

class ProdutoEletronico extends Produto {
  String nfe;
  int tempoGarantia;

  ProdutoEletronico({
    required super.descricao,
    required super.valor,
    required super.taxaImposto,
    required super.codigoDeBarras,
    required this.nfe,
    required this.tempoGarantia,
  })
  // : super(
  //        descricao: descricao,
  //        valor: valor,
  //        taxaImposto: taxaImposto,
  //        codigoDeBarras: codigoDeBarras,
  //      )
  ;
}

void main() {
  const double test = 100_000;
  print(test);
}
