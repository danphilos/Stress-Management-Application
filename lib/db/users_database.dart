import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:stress_management_app/models/user.dart';

class MindDatabase {
  static final MindDatabase instance = MindDatabase._init();

  static Database? _database;

  MindDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('mind.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final usernameType = 'TEXT NOT NULL UNIQUE';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableUsers ( 
  ${UserFields.id} $idType, 
  ${UserFields.username} $usernameType,
  ${UserFields .password} $textType
  )
''');
  }

  Future<User> create(User user) async {
    final db = await instance.database;
    final id = await db.insert(tableUsers, user.toJson());
    return user.copy(id: id);
  }

  Future<User> readUser(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<User>> readAllUser() async {
    final db = await instance.database;

    // final orderBy = '${NoteFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableUsers);

    return result.map((json) => User.fromJson(json)).toList();
  }

  Future<int> update(User user) async {
    final db = await instance.database;

    return db.update(
      tableUsers,
      user.toJson(),
      where: '${UserFields.id} = ?',
      whereArgs: [UserFields.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableUsers,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<User> signUp(User user) async {
    final db = await instance.database;
    final id = await db.insert(tableUsers, user.toJson());
    return user.copy(id: id);
  }

  Future<User?> logIn(String username, String password) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
      where: '${UserFields.username} = ? AND ${UserFields.password} = ?',
      whereArgs: [username, password],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      return null; // User not found
    }
  }




  Future close() async {
    final db = await instance.database;

    db.close();
  }

}