import '../models/contact.model.dart';
import '../services/add_contact.service.dart';
import '../services/get_all_contacts.service.dart';

/// Repositório que orquestra os serviços de contatos.
class ContactRepository {
  final GetAllContactsLocalService _getAllContacts;
  final AddContactLocalService _addContact;

  ContactRepository({
    required GetAllContactsLocalService getAllContacts,
    required AddContactLocalService addContact,
  })  : _getAllContacts = getAllContacts,
        _addContact = addContact;

  /// Retorna todos os contatos salvos.
  Future<List<Contact>> getAllContacts() => _getAllContacts();

  /// Adiciona um novo contato com [nome] e [telefone].
  Future<void> addContact(String nome, String telefone) => _addContact(nome, telefone);
}
