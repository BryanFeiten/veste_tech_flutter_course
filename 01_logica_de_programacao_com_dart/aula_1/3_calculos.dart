void main() {
  mediaAritmetica();
}

void somaSimples() {
  final a = 3;
  final b = 15;

  print('O resultado da soma de $a e $b é ${a + b}');
}

void divisao() {
  final totalCompra = 149.90;
  final parcelas = 2;
  final valorPorParcela = totalCompra / parcelas;

  print(
    'O valor total da compra foi R\$ ${totalCompra.toStringAsFixed(2).replaceAll('.', ',')}',
  );
  print(
    'Forma de pagamento: $parcelas x de R\$ ${valorPorParcela.toStringAsFixed(2).replaceAll('.', ',')}',
  );
}

void multiplicacao() {
  final minutos = 120;
  final segundos = minutos * 60;

  print('$minutos minutos equivalem a $segundos segundos!');
}

void mediaAritmetica() {
  final nome = 'estudante 1';

  final nota1 = 6;
  final nota2 = 3;
  final nota3 = 9;

  final media = (nota1 + nota2 + nota3) / 3;

  print(
    'O aluno $nome ficou com a média ${media.toStringAsFixed(2).replaceAll('.', ',')}',
  );
}
