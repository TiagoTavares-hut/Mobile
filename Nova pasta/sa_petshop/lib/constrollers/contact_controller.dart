import '../models/contact_model.dart';
import '../services/contact_db_helper.dart';

class ContactController {
  final ContactDbHelper _dbHelper = ContactDbHelper();

  // Criar contato
  Future<int> createContact(Contact contact) async {
    return await _dbHelper.insertContact(contact);
  }

  // Listar todos os contatos
  Future<List<Contact>> readContacts() async {
    return await _dbHelper.getContacts();
  }

  // Buscar contato por ID
  Future<Contact?> readContactById(int id) async {
    return await _dbHelper.getContactById(id);
  }

  // Atualizar contato
  Future<int> updateContact(Contact contact) async {
    return await _dbHelper.updateContact(contact);
  }

  // Deletar contato
  Future<int> deleteContact(int id) async {
    return await _dbHelper.deleteContact(id);
  }
}