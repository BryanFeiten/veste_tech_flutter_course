import 'package:mobx/mobx.dart';

import '../models/contact.model.dart';
import '../repositories/contact.repository.dart';

part 'contact.store.g.dart';

/// Store responsável por gerenciar o estado da agenda de contatos.
// ignore: library_private_types_in_public_api
class ContactStore = _ContactStore with _$ContactStore;

abstract class _ContactStore with Store {
  _ContactStore(this._repository);

  final ContactRepository _repository;

  /// Lista privada de contatos – acesso apenas via getter público.
  @observable
  ObservableList<Contact> _contacts = ObservableList<Contact>();
  ObservableList<Contact> get contacts => _contacts;

  /// Controla se a operação de carregamento está em andamento.
  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// Texto do campo de nome do novo contato.
  @observable
  String _newContactName = '';
  String get newContactName => _newContactName;

  /// Texto do campo de telefone do novo contato.
  @observable
  String _newContactPhone = '';
  String get newContactPhone => _newContactPhone;

  /// Carrega todos os contatos do repositório.
  @action
  Future<void> loadContacts() async {
    _isLoading = true;
    try {
      final result = await _repository.getAllContacts();
      _contacts.clear();
      _contacts.addAll(result);
    } catch (e) {
      /* Em caso de falha, mantém a lista atual */
    } finally {
      _isLoading = false;
    }
  }

  /// Adiciona um novo contato e recarrega a lista.
  @action
  Future<void> addContact() async {
    if (_newContactName.trim().isEmpty || _newContactPhone.trim().isEmpty) return;

    await _repository.addContact(
      _newContactName.trim(),
      _newContactPhone.trim(),
    );
    _newContactName = '';
    _newContactPhone = '';
    await loadContacts();
  }

  /// Atualiza o nome do novo contato enquanto o usuário digita.
  @action
  void setNewContactName(String value) {
    _newContactName = value;
  }

  /// Atualiza o telefone do novo contato enquanto o usuário digita.
  @action
  void setNewContactPhone(String value) {
    _newContactPhone = value;
  }
}
