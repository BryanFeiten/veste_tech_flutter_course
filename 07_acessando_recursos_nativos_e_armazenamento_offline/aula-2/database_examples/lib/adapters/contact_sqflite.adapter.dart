import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/contact.model.dart';

/// Interface para operações de contatos no SQLite.
/// Oculta os detalhes de implementação do pacote sqflite.
abstract interface class IContactSqfliteAdapter {
  /// Inicializa o banco de dados e cria as tabelas necessárias.
  Future<void> init();

  /// Retorna todos os contatos salvos.
  Future<List<Contact>> getAll();

  /// Salva um novo [contact].
  Future<void> save(Contact contact);
}

/// Implementação concreta que utiliza o SQLite como banco de dados local.
class ContactSqfliteAdapter implements IContactSqfliteAdapter {
  static const String _dbName = 'agenda_contatos.db';
  static const int _dbVersion = 1;
  static const String _tableName = 'contacts';

  late Database _db;

  @override
  Future<void> init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    _db = await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _createTables,
    );
  }

  Future<void> _createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        telefone TEXT NOT NULL
      )
    ''');
  }

  @override
  Future<List<Contact>> getAll() async {
    final maps = await _db.query(_tableName, orderBy: 'nome ASC');

    return maps
        .map(
          (map) => Contact(
            id: map['id'] as int,
            nome: map['nome'] as String,
            telefone: map['telefone'] as String,
          ),
        )
        .toList();
  }

  @override
  Future<void> save(Contact contact) async {
    await _db.insert(_tableName, {
      'nome': contact.nome,
      'telefone': contact.telefone,
    });
  }
}
