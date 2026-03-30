class Prova {
  String disciplina;
  double nota;

  Prova(this.disciplina, this.nota);
}

class Aluno {
  String nome;
  String _id;
  String get id => _id;

  final List<Prova> _provas = [];

  Aluno(this.nome, String id) : _id = id;

  List<Prova> get provas => _provas;

  void adicionarProva(Prova p) {
    _provas.add(p);
    print("Prova de ${p.disciplina} adicionada ao aluno $nome.");
  }

  double get media {
    if (_provas.isEmpty) return 0.0;

    double soma = _provas.fold(0, (total, prova) => total + prova.nota);
    return soma / _provas.length;
  }

  String verificarStatus() {
    double m = media;
    if (m >= 7) {
      return "Aprovado";
    } else if (m >= 5) {
      return "Em Recuperação";
    } else {
      return "Reprovado";
    }
  }
}

class AlunoEspecial extends Aluno {
  AlunoEspecial(String nome, String id) : super(nome, id);

  @override
  String verificarStatus() {
    double m = media;
    // Regra específica: Não tem recuperação.
    // Nota >= 5 passa, senão reprova.
    if (m >= 5) {
      return "Aprovado (Especial)";
    } else {
      return "Reprovado (Especial)";
    }
  }
}

class AlunoConvidado extends Aluno {
  AlunoConvidado(String nome, String id) : super(nome, id);

  @override
  String verificarStatus() {
    // Regra específica: Não pode reprovar.
    return "Aprovado (Convidado)";
  }
}

void main() {
  // --- Aluno Comum ---
  print("--- ALUNO COMUM ---");
  Aluno a1 = Aluno("João", "001");
  a1.adicionarProva(Prova("Matemática", 6.0));
  a1.adicionarProva(Prova("Português", 5.0));
  // Média: 5.5 -> Esperado: Recuperação
  print("Média: ${a1.media} | Status: ${a1.verificarStatus()}");

  // --- Aluno Especial ---
  print("\n--- ALUNO ESPECIAL ---");
  AlunoEspecial a2 = AlunoEspecial("Maria", "002");
  a2.adicionarProva(Prova("Matemática", 6.0));
  a2.adicionarProva(Prova("Português", 5.0));
  // Média: 5.5 -> Esperado: Aprovado (pois >= 5 e não tem recuperação)
  print("Média: ${a2.media} | Status: ${a2.verificarStatus()}");

  // --- Aluno Convidado ---
  print("\n--- ALUNO CONVIDADO ---");
  AlunoConvidado a3 = AlunoConvidado("Pedro", "003");
  a3.adicionarProva(Prova("Matemática", 2.0));
  a3.adicionarProva(Prova("Português", 3.0));
  // Média: 2.5 -> Esperado: Aprovado (regra do convidado)
  print("Média: ${a3.media} | Status: ${a3.verificarStatus()}");

  // --- Teste de Encapsulamento ---
  // a1._provas.removeLast(); // ERRO DE COMPILAÇÃO!
  // Isso mostra aos alunos que a lista está protegida dentro da classe.
}
