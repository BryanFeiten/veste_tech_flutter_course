import 'dart:math';

import 'package:app_to_tests/calculator.app.dart';
import 'package:flutter_test/flutter_test.dart';

// Teste Unitário
void main() {
  // Grupo
  // Teste
  // Estrutura de testes A.A.A.
  // Arrange  -> Preparar
  // Act      -> Age
  // Assert   -> Verificar/Checar

  group('Calculator -', () {
    group('addition -', () {
      test('Deve obter um resultado do tipo num', () {
        // Preparar
        const num numA = 2;
        const num numB = 9;

        // Agir
        final result = Calculator().addition(numA, numB);

        // Verificar
        expect(result, isA<num>());
      });

      test('Validar se soma corretamente 2 números positivos', () {
        // Preparar
        const num numA = 2;
        const num numB = 9;

        const num expectedResult = numA + numB;

        // Agir
        final result = Calculator().addition(numA, numB);

        // Verificar
        // expect(result, isA<num>());
        expect(result, equals(expectedResult));
      });

      test('Validar se soma corretamente 2 números negativos', () {
        // Preparar
        const num numA = -2;
        const num numB = -9;

        const num expectedResult = numA + numB;

        // Agir
        final result = Calculator().addition(numA, numB);

        // Verificar
        // expect(result, isA<num>());
        expect(result, equals(expectedResult));
      });

      test('Validar se soma corretamente 2 números negativos', () {
        // Preparar
        const num numA = -2;
        const num numB = 9;

        const num expectedResult = 7;

        // Agir
        final result = Calculator().addition(numA, numB);

        // Verificar
        // expect(result, isA<num>());
        expect(result, equals(expectedResult));
      });

      // Deve somar 2 variáveis quaisqueres -> Pulei pois precisariamos interagir com um Math.random(...)
      // Deve obter um resultado do tipo num
      // Validar se soma corretamente 2 números positivos
      // Validar se soma corretamente 2 números negativos
      // Validar se soma corretamente 1 número negativo e positivo
    });

    group('division -', () {
      test('Deve dividir corretamente quando ambos forem negativos', () {
        const numA = -34;
        const numB = -86;

        const expectedResult = numA / numB;

        final result = Calculator().division(numA, numB);

        expect(result, equals(expectedResult));
      });

      test('Deve lançar um erro quando o numB for 0', () {
        final numA = Random().nextInt(10);
        const numB = 0;

        num result() => Calculator().division(numA, numB);
        expect(result, throwsA(isA<Exception>()));
        // Duas formas de fazer a mesma coisa
        expect(
          () => Calculator().division(numA, numB),
          throwsA(isA<Exception>()),
        );
      });
      // O resultado deve ser um número (quando a entrada do numB for diferente de 0)
      // Deve lançar um erro quando o numB for 0
      // Deve dividir corretamente quando ambos forem negativos
      // Deve dividir corretamente quando ambos forem positivos
      // Deve dividir corretamente quando um for negativo e outro positivo
      // Deve dividir corretamente quando numA for 0 e numB for positivo
    });
  });
}
