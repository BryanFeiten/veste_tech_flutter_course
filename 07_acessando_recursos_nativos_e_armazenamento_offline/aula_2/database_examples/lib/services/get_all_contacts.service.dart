import '../adapters/contact_sqflite.adapter.dart';
import '../models/contact.model.dart';

/// Serviço responsável por listar todos os contatos da agenda.
class GetAllContactsLocalService {
  final IContactSqfliteAdapter _adapter;

  GetAllContactsLocalService(this._adapter);

  /// Retorna todos os contatos salvos no banco.
  Future<List<Contact>> call() async {
    return await _adapter.getAll();
  }
}
