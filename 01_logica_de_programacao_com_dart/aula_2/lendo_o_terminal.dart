import 'dart:io';

void main() {
  List<Map<String, dynamic>> produtos = [];
  bool lojaEstaAberta = true;

  while (lojaEstaAberta) {
    print("\x1B[2J\x1B[0;0H");

    print("=== MERCADINHO DO DEV ===");
    print("1 - Cadastrar Produto");
    print("2 - Listar Estoque");
    print("3 - Sair");
    stdout.write("Opção: ");

    var opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        print("\n--- NOVO PRODUTO ---");
        // TODO: Pedir dados ao usuário
        // TODO: Verificar duplicidade
        // TODO: Adicionar na lista
        stdin.readLineSync();
        break;

      case '2':
        print("\n--- ESTOQUE ATUAL ---");
        // TODO: Fazer o loop (for) para mostrar itens
        stdin.readLineSync();
        break;

      case '3':
        print("Fechando o caixa...");
        lojaEstaAberta = false;
        break;

      default:
        print("Opção inválida!");
        stdin.readLineSync();
    }
  }
}
