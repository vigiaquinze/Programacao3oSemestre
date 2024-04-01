import 'package:exemplo_persistencia_sqllite/Model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String DATABASE_NAME = 'contacts.db'; //nome do banco de dados
  static const String TABLE_NAME = 'contacts'; //nome da tabela
  static const String CREATE_CONTACTS_TABLE_SCRIPT = //script SQL para criar a tabela
  "CREATE TABLE contacts (id INTEGER PRIMARY KEY, name TEXT, email TEXT, phone TEXT, addressLine1 TEXT)";


  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
      return db.execute(CREATE_CONTACTS_TABLE_SCRIPT);
      },
      version: 1,
    );
  }
}
