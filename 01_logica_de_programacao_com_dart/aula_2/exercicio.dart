// ignore_for_file: avoid_dynamic_calls

import 'dart:io';

///

///

///
///
///
/// Cada produto no carrinho de compras deverá ter as seguintes informações: Nome, valor e quantidade.
///
/// Dicas:
/// • Para manter o sistema rodando até que o usuário decida finalizar a
/// compra, você deverá utilizar um laço de repetição (while ou do-
/// while).
/// • Para limpar o terminal você pode colocar fazer assim:
/// print(&quot;\x1B[2J\x1B[0;0H&quot;);

List<Map<String, dynamic>> carrinhoDeCompra = [];

void main() {
  print("Você está no DEV-MARKET");

  menu();

  // print("Volte sempre ao DEV-MARKET");
}

void menu() {
  String? opcao;

  do {
    print('''As seguintes opções estão disponíveis:
    1: Cadastrar produto
    2: Listar produtos
    3: Remover produtos
    4: Finalizar compra
    ''');

    opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        print('Você escolheu a opção de CADASTRO DE PRODUTO');
        cadastrarProduto();

        break;
      case '2':
        print('Você escolheu a opção de LISTAR PRODUTOS');
        listarProdutos();

        break;
      case '3':
        print('Você escolheu a opção de REMOVER PRODUTO');
        removerProduto();

        break;
      case '4':
        print('Você escolheu a opção de FINALIZAR COMPRA');
        finalizarCompra();

        break;
      default:
        print('Opção inválida');

        break;
    }
  } while (opcao != '4');
}

void cadastrarProduto() {
  /// 1 - Cadastrar produto
  /// Deverá ser solicitado para o usuário as seguintes informações:
  /// nome, valor e quantidade. Se no carrinho de compras já existir o
  /// produto que o usuário está informando, deve ser somada a
  /// quantidade que ele está adicionando agora com a quantidade que
  /// já tinha no carrinho
  ///
  /// nome
  /// valor
  /// quantidade

  stdout.write('Digite o nome do produto: ');
  final String? nome = stdin.readLineSync();

  stdout.write('Digite o valor desse produto: ');
  final double? valor = double.parse(stdin.readLineSync()!);

  stdout.write('Digite o quantidade desse produto: ');
  final int quantidade = int.parse(stdin.readLineSync()!);

  final produto = {'nome': nome, 'valor': valor, 'quantidade': quantidade};

  // Procurar se o produto já está no carrinho
  final indexDoProduto = carrinhoDeCompra.indexWhere(
    (p) => p['nome'] == produto['nome'],
  );
  final bool produtoExiste = indexDoProduto >= 0;

  if (!produtoExiste) {
    carrinhoDeCompra.add(produto);
    print(
      'O produto ${produto['nome']} foi adicionado ao carrinho de compras!',
    );

    return;
  }

  carrinhoDeCompra[indexDoProduto]['quantidade'] += quantidade;
  carrinhoDeCompra[indexDoProduto]['valor'] = valor;

  print('O produto ${produto['nome']} foi atualizado!');
}

void finalizarCompra() {
  /// 4 - Finalizar compra
  /// Deverá listar todos os produtos de forma organizada e no final
  /// mostrar o total a pagar. Depois deve ser finalizado o programa.

  listarProdutos();

  final valorTotal = carrinhoDeCompra.fold(0.0, (vTotal, produto) {
    final double valor = produto['valor'];
    final int quantidade = produto['quantidade'];

    final double valorTotalDesseProduto = valor * quantidade;

    return vTotal += valorTotalDesseProduto;
  });

  // final valorTotalComArrowFunction = carrinhoDeCompra.fold(
  //   0.0,
  //   (vTotal, produto) => vTotal += produto['valor'] * produto['quantidade'],
  // );

  final valorTotalBonito = trataValorMonetario(valorTotal);

  print('O valor total da sua compra foi: R\$ ${valorTotalBonito}');

  print('\n\n--------------------------------\n\n');
}

void listarProdutos() {
  /// 2 - Listar produtos
  /// Deverá ser mostrado de forma organizada as informações do
  /// produto que estão no carrinho de compras.

  print('\n\n--------------------------------');
  print('Listando os produtos do carrinho');

  for (final produto in carrinhoDeCompra) {
    print('''
      Nome: ${produto['nome']}
      Quantidade: ${produto['quantidade']}
      Valor unitário/kg: ${trataValorMonetario(produto['valor'])}
    ''');
  }

  print('--------------------------------\n\n');
}

String trataValorMonetario(double valor) {
  return valor.toStringAsFixed(2).replaceAll('.', ',');
}

void removerProduto() {
  /// 3 - Remover produto
  /// Deverá solicitar o nome do produto e remover ele do carrinho de
  /// compras

  stdout.write('\nDigite o nome do produto que deseja remover: ');
  final nomeDoProdutoParaRemover = stdin.readLineSync()!;

  if (nomeDoProdutoParaRemover.isEmpty) {
    print('Nome inválido');
    return;
  }

  // -------- Remoção com indexWhere: START

  final indexDoProduto = carrinhoDeCompra.indexWhere(
    (p) => p['nome'] == nomeDoProdutoParaRemover,
  );
  final produtoEstaNoCarrinho = indexDoProduto >= 0;

  if (!produtoEstaNoCarrinho) {
    print('O produto não está no carrinho\n\n');
    return;
  }

  final produtoRemovido = carrinhoDeCompra.removeAt(indexDoProduto);
  print('O produto ${produtoRemovido['nome']} foi removido com sucesso!\n\n');

  // -------- Remoção com indexWhere: END

  // // -------- Remoção com removeWhere: START

  // carrinhoDeCompra.removeWhere(
  //   (produto) => produto['nome'] == nomeDoProdutoParaRemover,
  // );

  // print('O produto ${nomeDoProdutoParaRemover} foi removido com sucesso!\n\n');

  // // -------- Remoção com removeWhere: END
  // // -------- Remoção com for: START

  // bool encontrou = false;

  // for (int index = 0; index < carrinhoDeCompra.length; index++) {
  //   final produto = carrinhoDeCompra[index];
  //   final nomeDoProduto = produto['nome'];
  //   // final nomeDoProdutoDireto = carrinhoDeCompra[i]['nome'];

  //   if (nomeDoProduto == nomeDoProdutoParaRemover) {
  //     encontrou = true;

  //     carrinhoDeCompra.removeAt(index);
  //     break;
  //   }
  // }

  // if (encontrou) {
  //   print('Produto $nomeDoProdutoParaRemover removido com sucesso');
  // } else {
  //   print('Produto não encontrado no carrinho');
  // }

  // // -------- Remoção com for: END

  // -------- Remoção com for in: START

  bool encontrou = false;

  for (final produto in carrinhoDeCompra) {
    final nomeDoProduto = produto['nome'];

    if (nomeDoProduto == nomeDoProdutoParaRemover) {
      encontrou = true;

      carrinhoDeCompra.remove(produto);
      break;
    }
  }

  if (encontrou) {
    print('Produto $nomeDoProdutoParaRemover removido com sucesso');
  } else {
    print('Produto não encontrado no carrinho');
  }

  // -------- Remoção com for in: END
}
