class Curso {
  String titulo;
  String nomeMentor;
  int duracao;

  Curso({
    required this.titulo,
    required this.nomeMentor,
    required this.duracao,
  });
}

class Aluno {
  String nome;
  int idade;
  bool ativo;

  Aluno({required this.nome, required this.idade}) : ativo = false {
    print('aluno $nome matriculado');
  }

  void matricular() {
    ativo = true;
    print('Matriculado');
  }

  void formar() {
    ativo = false;
    print('Formado');
  }
}

void main() {
  final fullStack = Curso(
    titulo: 'Full-Stack',
    nomeMentor: 'Paulo',
    duracao: 300,
  );
  final mobile = Curso(
    titulo: 'Desenvolvimento Mobile',
    nomeMentor: 'Edson',
    duracao: 300,
  );
}
