// ignore_for_file: unused_local_variable
import 'dart:math';

import 'animal.dart';

class Cachorro extends Animal {
  // Construtor nomeado "superDentro"
  const Cachorro.superDentro({
    required String super.nome,
    required super.especie,
    required String super.coberturaCorporal,
  });

  // Construtor nomeado "superFora"
  const Cachorro.construtorNomeado2({
    required String nome,
    required String especie,
    required String coberturaCorporal,
  }) : super.coberturaCorporalObrigatoria(
         nome: nome,
         especie: especie,
         coberturaCorporal: coberturaCorporal,
       );

  // // É exatamente igual a eu NÃO declarar nada
  // @override
  // void emitirSom() {
  //   super.emitirSom();
  // }

  // @override
  // void emitirSom() {
  //   print('Auau');
  // }

  @override
  void emitirSom() {
    print('Sou um cachorro, meu nome é ${nome} emitindo: ');
    super.emitirSom();
  }

  @override
  void andar(int metros) {
    print(
      'Sou um cachorro, e vou andar... O cachorro vai andar $metros metros',
    );
    super.andar(metros);
  }

  void emitirOutroSom() {}
}

class Dalmata extends Cachorro {
  late int idade;

  // Construtor nomeado "superDentro"
  Dalmata(String nome)
    : super.superDentro(
        nome: nome,
        especie: 'Dálmata',
        coberturaCorporal: 'Pelos brancos e pretos',
      ) {
    idade = Random().nextInt(100);
  }
}

void main() {
  final cachorro = Cachorro.superDentro(
    nome: 'Cripto',
    especie: 'Vira lata',
    coberturaCorporal: 'Alguma cobertura',
  );

  // final cachorro2 = Cachorro.construtorNomeado2(
  //   nome: 'Cripto',
  //   especie: 'Vira lata',
  //   coberturaCorporal: 'Alguma cobertura',
  // );

  // cachorro1.emitirSom();
  cachorro.andar(5);
}
