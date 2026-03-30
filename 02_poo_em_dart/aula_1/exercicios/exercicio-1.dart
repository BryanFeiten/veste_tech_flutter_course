class ContaCorrente {
  int numeroConta;
  String nomeCorrentista;

  double _saldo;
  double get saldo => _saldo;

  ContaCorrente({
    required this.numeroConta,
    required this.nomeCorrentista,
    double saldoInicial = 0,
  }) : _saldo = saldoInicial;

  void alterarNome(String novoNome) {
    // novoNome = novoNome.trim();
    // if (novoNome.isEmpty) return;

    nomeCorrentista = novoNome;
  }

  void deposito(double valor) {
    if (valor > 0) {
      _saldo += valor;
      print("Depósito de R\$ $valor realizado. Novo saldo: R\$ $_saldo");
    } else {
      print("Valor de depósito inválido.");
    }
  }

  void saque(double valor) {
    if (valor <= _saldo && valor > 0) {
      _saldo -= valor;
      print("Saque de R\$ $valor realizado. Novo saldo: R\$ $_saldo");
    } else {
      print("Saldo insuficiente ou valor inválido.");
    }
  }
}

void main() {
  ContaCorrente conta1 = ContaCorrente(
    numeroConta: 123,
    nomeCorrentista: "João da Silva",
  );

  print("Conta: ${conta1.nomeCorrentista} | Saldo: ${conta1.saldo}");

  // Tentando sacar sem saldo
  conta1.saque(50); // Deve dar erro de saldo insuficiente

  // Depositando
  conta1.deposito(100);

  // Sacando corretamente
  conta1.saque(30);

  // Alterando nome
  conta1.alterarNome("João Silva e Souza");
  print("Nome atualizado: ${conta1.nomeCorrentista}");
}
