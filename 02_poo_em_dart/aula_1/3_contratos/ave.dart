class Ave {
  void botarOvo() {
    print('Botou um ovo!');
  }
}

abstract class Voador {
  void voar();
}

abstract class Nadador {
  void nadar();
}

class Pato extends Ave implements Voador, Nadador {
  @override
  void nadar() {
    print('O pato tá boiando na lagoa');
  }

  @override
  void voar() {
    print('O pato voa desengonçado');
  }
}

class Aviao implements Voador {
  @override
  void voar() {
    print('Avião está voando');
  }
}

void exemplo1() {
  final pato = Pato();
  pato.botarOvo();
}

void exemplo2() {
  final pato = Pato();
  pularDoPenhasco(pato);

  final aviao = Aviao();
  pularDoPenhasco(aviao);
}

void exemplo3() {
  final pato = Pato();

  algoQueSoAvesFazem(pato);
}

void pularDoPenhasco(Voador algoQueVoe) {
  algoQueVoe.voar();
}

void nadarNoRiozinho(Nadador algoQueNade) {
  algoQueNade.nadar();
}

void algoQueSoAvesFazem(Ave ave) {
  ave.botarOvo();
}
