// > Grupo    +   Usuário
// > Estante  +   Livro

// Agregação: São classes que sobrevivem de forma independente, porém, uma pode agregar ficando armazenada (instância) dentro da outra

class Grupo {
  final String nome;
  Admin admin;
  final List<Usuario> usuarios;

  Grupo.vazio({required this.nome, required Admin admin})
    : admin = admin,
      usuarios = const [];

  Grupo.comAdmin({required Admin admin, required this.nome})
    : admin = admin,
      usuarios = [admin];

  // Grupo.comAdminECorpo({required Usuario admin, required this.nome}) {
  //   usuarios = [admin];
  // }

  // static Future<Grupo?> fromApi(Map<String, dynamic> map) async {
  //   final nomeGrupo = map['nome'];
  //   if (nomeGrupo! is String) return null;

  //   return Grupo.vazio(nome: nomeGrupo);
  // }

  void adicionarUsuario(Usuario usuario) {
    usuarios.add(usuario);
  }
}

class Usuario {
  final String nome;
  final String numeroDeTelefone;

  const Usuario({required this.nome, required this.numeroDeTelefone});

  @override
  String toString() {
    return 'Usuario(nome: $nome, numeroDeTelefone: $numeroDeTelefone)';
  }
}

class Admin extends Usuario {
  final String nomeDeAdmin;
  const Admin({required super.nome, required super.numeroDeTelefone})
    : nomeDeAdmin = 'Admin novo';

  void seApresentar() {
    print('Me chamo $nomeDeAdmin');
  }
}

void main() {
  final admin1 = Admin(
    nome: 'Alexandre',
    numeroDeTelefone: '+55 51 9 9999-9999',
  );

  final grupoDaTurma1 = Grupo.vazio(
    nome: 'Grupo da Turma de Flutter',
    admin: admin1,
  );

  print(grupoDaTurma1.admin);
  print(grupoDaTurma1.nome);
  print(grupoDaTurma1.usuarios);

  final grupo2 = Grupo.comAdmin(
    admin: admin1,
    nome: 'Grupo da Turma de Flutter 2025',
  );

  print(grupo2.admin);
  print(grupo2.nome);
  print(grupo2.usuarios);

  // final usuario1 = Usuario(
  //   nome: 'Bryan',
  //   numeroDeTelefone: '+55 51 9 9999-9999',
  // );

  // grupoDaTurma1.adicionarUsuario(usuario1);

  // final usuario2 = Usuario(
  //   nome: 'Diego',
  //   numeroDeTelefone: '+55 51 9 9999-8888',
  // );

  // final grupoDaTurma = Grupo.comAdmin(
  //   nome: 'Grupo da Turma de Flutter',
  //   admin: usuario2,
  // );

  // print(grupoDaTurma.usuarios);

  // grupoDaTurma.adicionarUsuario(usuario1);
  // print(grupoDaTurma.usuarios);

  // // grupoDaTurma.adicionarUsuario(usuario2);
  // // print(grupoDaTurma.usuarios);
}
