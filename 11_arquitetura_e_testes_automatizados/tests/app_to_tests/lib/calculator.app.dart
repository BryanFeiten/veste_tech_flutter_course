class Calculator {
  /// Complexidade ciclomática: 1
  num addition(num a, num b) {
    final result = a + b;

    print('$a plus $b equals $result');

    return result;
  }

  /// Complexidade ciclomática: 1
  num subtraction(num a, num b) {
    final result = a - b;

    print('$a minus $b equals $result');

    return result;
  }

  /// Complexidade ciclomática: 1
  num multiplication(num a, num b) {
    final result = a * b;

    print('$a times $b equals $result');

    return result;
  }

  /// Complexidade ciclomática: 2
  num division(num a, num b) {
    if (b == 0) {
      throw Exception('Não é possível dividir por 0');
    }

    final result = a / b;

    print('$a divided by $b equals $result');

    return result;
  }
}
