import 'dart:async';

void main() async {
  print("Iniciando o sistema...\n");

  // 1. O CANO DE DADOS
  // Criamos o nosso controlador. Ele é o dono do cano.
  final controlador = StreamController<String>();

  // 2. A PONTA DE SAÍDA (Ouvinte / Listener)
  // Alguém fica na ponta do cano esperando as coisas caírem.
  controlador.stream.listen((mensagem) {
    print("📥 O app recebeu: $mensagem");
  });

  await Future.delayed(Duration(seconds: 2));

  // 3. A PONTA DE ENTRADA (Sink)
  // Nós, em qualquer lugar do código, podemos jogar coisas dentro do "cano".
  print("📤 Jogando o primeiro dado no cano...");
  controlador.sink.add("Usuário conectou no 4G");

  await Future.delayed(Duration(seconds: 1));

  print("📤 Jogando o segundo dado no cano...");
  controlador.sink.add("Usuário perdeu o sinal");

  await Future.delayed(Duration(seconds: 1));

  print("📤 Jogando o terceiro dado no cano...");
  controlador.sink.add("Usuário recurerou o sinal");

  // Fechamos o "cano" (Sempre importante limpar a memória)
  controlador.close();
}
