/// Modelo que representa um contato na agenda.
class Contact {
  final int id;
  final String nome;
  final String telefone;

  Contact({this.id = 0, required this.nome, required this.telefone});

  Contact copyWith({int? id}) {
    return Contact(
      id: id ?? this.id,
      nome: nome,
      telefone: telefone,
    );
  }

  @override
  String toString() => 'Contact(id: $id, nome: $nome, telefone: $telefone)';
}
