import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/contact_model.dart';

class ContactDbHelper {
  static Database? _database;
  static final ContactDbHelper _instance = ContactDbHelper._internal();

  ContactDbHelper._internal();
  factory ContactDbHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "contacts.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreateDB,
    );
  }

  Future<void> _onCreateDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE contacts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        telefone TEXT NOT NULL,
        email TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertContact(Contact contact) async {
    final db = await database;
    return await db.insert('contacts', contact.toMap());
  }

  Future<List<Contact>> getContacts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('contacts');
    return List.generate(maps.length, (i) => Contact.fromMap(maps[i]));
  }

  Future<Contact?> getContactById(int id) async {
    final db = await database;
    final maps = await db.query('contacts', where: 'id=?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Contact.fromMap(maps.first);
    }
    return null;
  }

  Future<int> deleteContact(int id) async {
    final db = await database;
    return await db.delete('contacts', where: 'id=?', whereArgs: [id]);
  }

  Future<int> updateContact(Contact contact) async {
    final db = await database;
    return await db.update(
      'contacts',
      contact.toMap(),
      where: 'id=?',
      whereArgs: [contact.id],
    );
  }
}