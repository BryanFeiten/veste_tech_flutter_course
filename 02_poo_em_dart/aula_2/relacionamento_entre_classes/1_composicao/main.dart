// > Carro      +     Motor
// > Postagem   +     Comentario
// > Casa       +     Cômodo
// > Usuário    +     Mensagem

// Composição: As classes existem durante um mesmo ciclo de vida, não de forma independente

// class Carro {
//   final Motor motor;
//   int qtdePortas;

//   Carro({this.qtdePortas = 2}) : motor = Motor();
// }

// class Carro2 {
//   final Motor motor = Motor();
//   final int qtdePortas;

//   Carro2({this.qtdePortas = 2});
// }

// class Motor {
//   const Motor();

//   void ligarMotor() {
//     print('Motor ligado');
//   }
// }

class Carro {
  final String marca;
  final String modelo;
  final Motor motor;
  final Carroceria carroceria;

  Carro({
    required this.marca,
    required this.modelo,
    int qtdePortas = 2,
    required int cilindros,
  }) : motor = Motor(cilindros: cilindros),
       carroceria = Carroceria(qtdePortas: qtdePortas);
}

class Carro2 {
  late Motor motor;
  final int qtdePortas;

  Carro2({this.qtdePortas = 2, required int cilindros}) {
    motor = Motor(cilindros: cilindros);
  }

  Carro2.semMotor({this.qtdePortas = 2});
}

class Motor {
  final int cilindros;

  const Motor({required this.cilindros});

  void ligarMotor() {
    print('Motor ligado');
  }
}

class Carroceria {
  final int qtdePortas;

  const Carroceria({required this.qtdePortas});
}

void main() {
  final carro = Carro(
    qtdePortas: 4,
    cilindros: 4,
    marca: 'Ferrari',
    modelo: 'any',
  );

  carro.motor.ligarMotor();

  final carroSemMotor = Carro2.semMotor();
  carroSemMotor.motor = Motor(cilindros: 3);

  final Motor motor = carroSemMotor.motor;

  motor.ligarMotor();
}
