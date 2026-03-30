void main() {
  print('Primeira atividade');
  primeiraAtividade();
  print('\n-----------------------------\n\n');
  print('Segunda atividade');
  segundaAtividade();
  print('\n-----------------------------\n\n');
}

void primeiraAtividade() {
  final nome = 'Bryan Feiten';
  final idade = 24;
  final cidade = 'Campo Bom';

  print(nome);
  print(idade);
  print(cidade);
  print('Olá! Me chamo $nome, tenho $idade anos e moro em $cidade');
}

void segundaAtividade() {
  int a = 10;
  int b = 20;
  int? coringa;

  void printVars() {
    print('a = $a; b = $b; coringa = $coringa');
  }

  print('---  Início ---');
  printVars();

  coringa = a;

  print('\n---  Primeiro passo ---');
  printVars();

  print('\n---  Segundo passo ---');
  a = b;
  printVars();

  print('\n---  Terceiro passo ---');
  b = coringa;
  printVars();

  print('\n---  Valor final ---');
  coringa = null;
  printVars();
}
