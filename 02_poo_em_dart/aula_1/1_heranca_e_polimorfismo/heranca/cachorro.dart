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
