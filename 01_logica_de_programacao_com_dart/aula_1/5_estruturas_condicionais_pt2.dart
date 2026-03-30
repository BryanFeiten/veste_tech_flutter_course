void main() {
  print('Atividade 1: Operador Ternário');
  ternario();
  print('\n-----------------------------\n');

  print('Atividade 2: Switch Case (Menu de opções)');
  switchCase();
  print('\n-----------------------------\n');
}

void ternario() {
  final isPremium = true;

  // Estrutura clássica
  /*
  String mensagem;
  if (isPremium) {
    mensagem = 'Bem-vindo, usuário VIP!';
  } else {
    mensagem = 'Bem-vindo, usuário Grátis!';
  }
  */

  // Operador Ternário: Condição ? Verdadeiro : Falso
  // Dica: Isso será MUITO usado no Flutter para mostrar ou esconder coisas na tela
  final mensagem = isPremium
      ? 'Bem-vindo, usuário VIP!'
      : 'Bem-vindo, usuário Grátis!';

  print(mensagem);
}

void switchCase() {
  // Simulando uma escolha de menu num aplicativo
  final opcaoSelecionada = 2;

  print('Opção escolhida: $opcaoSelecionada\n');

  switch (opcaoSelecionada) {
    case 1:
      print('Abrindo a tela de Perfil...');
      break;
    case 2:
      print('Abrindo a tela de Configurações...');
      break;
    case 3:
      print('Abrindo o Carrinho de Compras...');
      break;
    default:
      print('Opção inválida! Tente novamente.');
  }
}
