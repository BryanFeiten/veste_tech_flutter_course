import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../models/contact.model.dart';
import '../stores/contact.store.dart';

/// Página de agenda de contatos com formulário e listagem.
class SqflitePage extends StatefulWidget {
  final ContactStore contactStore;

  const SqflitePage({super.key, required this.contactStore});

  @override
  State<SqflitePage> createState() => _SqflitePageState();
}

class _SqflitePageState extends State<SqflitePage> {
  @override
  void initState() {
    super.initState();
    widget.contactStore.loadContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda de Contatos'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _ContactFormWidget(contactStore: widget.contactStore),
          const Divider(),
          Expanded(child: _ContactListWidget(contactStore: widget.contactStore)),
        ],
      ),
    );
  }
}

/// Formulário de adição de novo contato.
class _ContactFormWidget extends StatefulWidget {
  final ContactStore contactStore;

  const _ContactFormWidget({required this.contactStore});

  @override
  State<_ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<_ContactFormWidget> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: 'Nome',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person_outline),
            ),
            onChanged: (value) => widget.contactStore.setNewContactName(value),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(
              hintText: 'Telefone',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone_outlined),
            ),
            keyboardType: TextInputType.phone,
            onChanged: (value) => widget.contactStore.setNewContactPhone(value),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _addContact,
              icon: const Icon(Icons.person_add),
              label: const Text('Adicionar Contato'),
            ),
          ),
        ],
      ),
    );
  }

  void _addContact() {
    widget.contactStore.addContact();
    _nameController.clear();
    _phoneController.clear();
  }
}

/// Lista de contatos com carregamento e estado vazio.
class _ContactListWidget extends StatelessWidget {
  final ContactStore contactStore;

  const _ContactListWidget({required this.contactStore});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (contactStore.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (contactStore.contacts.isEmpty) {
          return const Center(
            child: Text(
              'Nenhum contato cadastrado ainda.',
              style: TextStyle(fontSize: 16),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: contactStore.contacts.length,
          itemBuilder: (_, index) {
            final contact = contactStore.contacts[index];
            return _ContactTileWidget(contact: contact);
          },
        );
      },
    );
  }
}

/// Tile individual de um contato.
class _ContactTileWidget extends StatelessWidget {
  final Contact contact;

  const _ContactTileWidget({required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(contact.nome),
      subtitle: Text(contact.telefone),
    );
  }
}
