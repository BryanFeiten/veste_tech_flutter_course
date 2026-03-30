void main() {
  print('Atividade 1: Maioridade (if / else)');
  isElse();
  print('\n-----------------------------\n');

  print('Atividade 2: Boletim Escolar (if / else if / else)');
  ifElseIf();
  print('\n-----------------------------\n');

  print('Atividade 3: Operadores Lógicos (AND e OR)');
  condicaoComposta();
  print('\n-----------------------------\n');
}

void isElse() {
  final idade = 20;

  print('Idade do cliente: $idade');

  if (idade >= 18) {
    print('Acesso liberado. O cliente é maior de idade.');
  } else {
    print('Acesso negado. O cliente é menor de idade.');
  }
}

void ifElseIf() {
  // Aproveitando a lógica do arquivo anterior (calculos)
  final nome = 'Estudante 1';
  final nota1 = 6;
  final nota2 = 3;
  final nota3 = 9;

  final media = (nota1 + nota2 + nota3) / 3;
  final mediaFormatada = media.toStringAsFixed(2).replaceAll('.', ',');

  print('Média do aluno $nome: $mediaFormatada');

  if (media >= 7) {
    print('Status: APROVADO! Parabéns!');
  } else if (media >= 5) {
    print('Status: EM RECUPERAÇÃO. Estude mais um pouco.');
  } else {
    print('Status: REPROVADO. Nos vemos no próximo ano.');
  }
}

void condicaoComposta() {
  final possuiIngresso = true;
  final estaComCarteiraDeEstudante = false;

  // Uso de concatenação de testes com "&&" (E)
  if (possuiIngresso && estaComCarteiraDeEstudante) {
    print('Pode entrar no show pagando meia-entrada!');
  } else {
    print('Não pode usar a fila de meia-entrada.');
  }

  // Mostrando o || (OU)
  final diaDaSemana = 'Sábado';
  if (diaDaSemana == 'Sábado' || diaDaSemana == 'Domingo') {
    print('Oba! Fim de semana!');
  } else {
    print('Dia de muito estudo e código.');
  }
}
