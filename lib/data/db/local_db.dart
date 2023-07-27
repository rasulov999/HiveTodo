import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_db/data/models/db_model.dart';

class LocalDatabase {
  LocalDatabase._init();
  static final LocalDatabase getInstance = LocalDatabase._init();
  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> getDb() async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDb("users.db");
      return _database!;
    }
  }

  Future<Database> _initDb(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: (db, ver) async {
      const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
      const textType = "TEXT NOT NULL";
      const intType = "INTEGER DEFAULT 0";
      const boolType = 'BOOLEAN NOT NULL';

      await db.execute('''
    CREATE TABLE $userTable (
    ${UsersFields.id} $idType,
    ${UsersFields.name} $textType,
    ${UsersFields.age} $textType
    )
    ''');
    });
  }

  static Future<UserModel> insertToDb(UserModel userModel) async {
    final db = await getInstance.getDb();
    final id = await db.insert(userTable, userModel.toJson());
    return userModel.copyWith(id: id);
  }

  static Future<List<UserModel>> getUsers() async {
    final dataBase = await getInstance.getDb();
    final listOfUser = await dataBase.query(userTable,
        columns: [UsersFields.id, UsersFields.name, UsersFields.age]);
    var listUsers = listOfUser.map((e) => UserModel.fromJson(e)).toList();
    return listUsers;
  }
}
