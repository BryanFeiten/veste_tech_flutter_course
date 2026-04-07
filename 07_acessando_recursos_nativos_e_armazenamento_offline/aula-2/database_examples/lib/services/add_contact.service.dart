import '../adapters/contact_sqflite.adapter.dart';
import '../models/contact.model.dart';

/// Serviço responsável por adicionar um novo contato na agenda.
class AddContactLocalService {
  final IContactSqfliteAdapter _adapter;

  AddContactLocalService(this._adapter);

  /// Adiciona um contato com [nome] e [telefone] no banco.
  Future<void> call(String nome, String telefone) async {
    final contact = Contact(nome: nome, telefone: telefone);
    await _adapter.save(contact);
  }
}
