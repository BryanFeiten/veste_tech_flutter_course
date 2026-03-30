// ignore_for_file: unused_local_variable, prefer_const_declarations, avoid_print

import 'dart:io';

bool test_1 = false;

void variableTypesSample() {
  const String nameUserA = 'Letícia';

  const num sum = 5 + 2.2;

  const int integerSum = 5 + 1;

  const double money = 25.5 + 12.3;

  const int age = 25;

  const bool isEnable = true;

  final inference = 'String';
  String declaredString = 'String';

  final Map<String, dynamic> user = {
    'name': 'Bryan',
    'age': 24,
    'isEnable': true,
    'phone': null,
  };

  final userName = user['name'];

  final Map<String, String> user2 = {'name': 'Bryan'};

  final List<String> phoneList = [
    '51999999999',
    '51888888888',
    '51777777777',
    '51666666666',
  ];

  final List<Map<String, dynamic>> userList = [
    user,
    {'name': 'Letícia', 'age': null, 'isEnable': true, 'phone': null},
    {'name': 'Jhonny', 'age': null, 'isEnable': true, 'phone': null},
  ];

  final numericList = [1, 2, 3, 4.2, 4.2];

  // Uso de variáveis fallback para casos nulos
  final String userNameFromInput1 = stdin.readLineSync()!;
  final String userNameFromInput2 = stdin.readLineSync() ?? '';

  final String? userNameFromInput3 = stdin.readLineSync();
}

void sample2() {
  final user1 = {
    'name': 'Letícia',
    'age': null,
    'isEnable': true,
    'phone': null,
  };

  final user2 = {'name': 'Bryan', 'age': null, 'isEnable': true, 'phone': null};

  final users = [
    user1,
    user2,
    {'name': 'Diego', 'age': null, 'isEnable': true, 'phone': null},
    {'name': 'Geovanni', 'age': null, 'isEnable': true, 'phone': null},
  ];
}

void sample3() {
  var a = 1.2;
  dynamic b = 1;
}

void printName(String name) {}

void printUserInfo(String name, int age, bool isEnable, String? phone) {}

void conditional() {
  /// Condicionais
  /// Repetição
  /// Funções

  /// IF

  final idade = 18;
  final valorQueTenhoNaCarteira = 1500;
  const idadeMinimaParaTirarCarteira = 18;
  const precoParaTirarACarteira = 3000;

  if (idade >= idadeMinimaParaTirarCarteira) {
    if (valorQueTenhoNaCarteira >= precoParaTirarACarteira) {
      print('Você pode tirar a carteira');
    } else {
      print('Você não tem dinheiro suficiente');
    }
  } else {
    print('Você não tem idade suficiente para tirar a carteira');
  }

  /// SWITCH-CASE

  final opcao = 1;

  switch (opcao) {
    case 1:
      print('Opção 1 selecionada');
    case 2:
      print('Opção 2 selecionada');
    case 3:
      print('Opção 3 selecionada');
    default:
      print('Opção inválida');
  }

  final diaDaSemanaInt = 1;

  if (diaDaSemanaInt == 1) {
    print('Domingo');
  } else if (diaDaSemanaInt == 2) {
    print('Segunda');
    quandoSegunda();
  } else if (diaDaSemanaInt == 3) {
    print('Terça');
  } else if (diaDaSemanaInt == 4) {
    print('Quarta');
  } else if (diaDaSemanaInt == 5) {
    print('Quinta');
  } else if (diaDaSemanaInt == 6) {
    print('Sexta');
  } else if (diaDaSemanaInt == 7) {
    print('Sábado');
  } else {
    print('Dia inválido');
  }

  switch (diaDaSemanaInt) {
    case 1:
      print('Domingo');
      break;
    case 2:
      print('Segunda');
      quandoSegunda();
      break;
    case 3:
      print('Terça');
      break;
    case 4:
      print('Quarta');
      break;
    case 5:
      print('Quinta');
      break;
    case 6:
      print('Sexta');
      break;
    case 7:
      print('Sábado');
      break;
    default:
      print('Dia inválido');
      break;
  }

  // Exemplo de acesso do switch
  final days = {
    1: 'Domingo',
    2: 'Segunda',
    3: 'Terça',
    4: 'Quarta',
    5: 'Quinta',
    6: 'Sexta',
    7: 'Sábado',
  };
  final day = days[5];
}

void quandoSegunda() {}
void lacosDeRepeticao() {
  /// Laços de repetição
  ///
  /// Do While
  ///
  /// While
  ///
  /// For

  int variable1 = 1;

  // WHILE

  while (variable1 < 5) {
    print('Significa que "variable1" é true');
    variable1 += 1;
  }

  // DO WHILE

  do {
    print('Executa uma vez, e após, executa apenas quando "variable1" é true');
    variable1 -= 1;
  } while (variable1 > 5);

  // FOR
  ///  for (declaracao; teste lógico; manipulação do valor) {
  ///     Execução
  /// }
  for (int i = 0; i < 5; i++) {
    print('Executou ${i + 1} vezes');
  }
  //
  //
  //
  //
  //

  // FOR IN

  final list = ['Letícia', 'Diego', 'Alexandre'];
  for (final value in list) {
    print('Valor: $value');
  }
  //
  //

  for (int i = 0; i < list.length; i++) {
    print('Valor: ${list[i]}');
  }

  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  // EXEMPLO DE WHILE COM INPUT DO USUÁRIO
  int userInput = 4;

  while (userInput != 4) {
    final rawInput = stdin.readLineSync() ?? '';

    final input = int.tryParse(rawInput);

    // Nossa própria função
    final ownInput = nossoTryParse(rawInput);

    if (input == null) {
      print('Input inválido');
      continue;
    }

    userInput = input;
  }

  // EXEMPLO COM ENTRADA COM DO WHILE

  int userInput2 = 4;

  do {
    // Avisa o usuário que ele precisa digitar um número
    print('Digite um número');
    // Recebe o número do usuário
    final rawInput = stdin.readLineSync() ?? '';

    // Tenta transformar o valor que o usuário digitou em um número
    final input = int.tryParse(rawInput);

    // Se o valor não é um int, entra aqui
    if (input == null) {
      print('Input inválido');
      // Reinicia o loop
      continue;
    }

    // Substitui a variável de inputs pelo número que o usuário digitou
    userInput2 = input;

    // Verifica se o input digitado é o que esperamos (se for, sai do loop, caso contrário, reinicia)
  } while (userInput2 != 4);
}

int? nossoTryParse(String value) {
  try {
    final inputWithParse = int.parse(value);
    return inputWithParse;
  } catch (e) {
    return null;
  }
}

void funcaoComRetornoVoid() {
  print('Essa função não retorna nenhum valor');
}

// Função
int funcaoComRetornoInt() {
  print('Essa função retorna um inteiro');

  return 5;
}

// Função
int soma(int a, int b) {
  final sum = a + b;
  print('A soma de $a + $b é: $sum');

  return sum;
}

List<int> adicionarItemSemModificarAListaOriginal(
  List<int> initialList,
  int newItem,
) {
  // Equivalente ao "add", porém, criando uma cópia, e não modificando a [initalList] original
  final newList = List.of([...initialList, newItem]);
  // // Equivalente ao "insert(0, item)", porém, criando uma cópia, e não modificando a [initalList] original
  // final newList2 = List.of([newItem, ...initialList]);

  // return [...initialList, newItem];
  return newList;
}

/// Exemplo da função [adicionarItemSemModificarAListaOriginal], mas modificando a lista original
List<int> adicionarItemModificandoAListaOriginal(
  List<int> initialList,
  int newItem,
) {
  initialList.add(newItem);
  return initialList;
}

void main() {
  final resultado = soma(10, 15);
  final resultado2 = soma(235, 294);

  final results = [resultado, resultado2];

  final resultado3 = soma(14, 5);

  final newResults = adicionarItemSemModificarAListaOriginal(
    results,
    resultado3,
  );
}

/// Tarefa de casa
/// - Revisitar a aula (código acima)
/// - Implementar o desafio final da "Lógica de Programação com Dart" (Módulo 1)
