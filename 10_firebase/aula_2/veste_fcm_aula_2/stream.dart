// void main() async {
//   print('Entendendo Streams (básico)');

//   // final resultFromFuture = await getMessages();
//   // print(resultFromFuture);

//   final resultFromStream = getMessagesStream().asBroadcastStream();
//   resultFromStream.listen(_handleStreamResult);
//   await resultFromStream.last;
//   print('Fechou a stream');
// }

void _handleStreamResult(List<String> event) {
  print(event);
}

Future<List<String>> getMessages() async {
  await Future.delayed(Duration(seconds: 2));

  return ['OI', 'Tudo bem?'];
}

// Stream

/// 1. Quando eu abrir a aplicação, deve carregar as mensagens do banco local (50ms)
/// 2. Enquanto a chamada para o backend acontece, o usuário não fica bloqueado no carregamento

// Exemplo de cold-stream
Stream<List<String>> getMessagesStream() async* {
  await Future.delayed(Duration(milliseconds: 50));

  final List<String> dbLocalResult = ['OI', 'Tudo bem?'];
  yield dbLocalResult;

  // Requisição demorada
  await Future.delayed(Duration(seconds: 2));
  final resultBackend = ['OI', 'Tudo bem?', 'Tudo certo, e vc'];

  yield resultBackend;
}

Stream<String> countStream() async* {
  yield 'Começando a contagem';

  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield 'Contando: $i';
  }

  yield 'Terminou a contagem';

  yield 'Finalizando stream';
}

void main() {
  print('Iniciando função');
  final stream = countStream();
  stream.listen((mensagem) => print(mensagem));
}
