import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user.dart';

class UserDatabase {
  static final UserDatabase instance = UserDatabase._init();

  static Database? _database;

  UserDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final integerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableUsers (
    ${UserFields.id} $idType,
    ${UserFields.username} $textType,
    ${UserFields.highestScore} $integerType,
    ${UserFields.scoreDate} $textType
    
    )
    ''');
  }

  Future<User> create(User user) async {
    final db = await instance.database;

    // final json = user.toJson();
    // final columns =
    //     '${UserFields.username}, ${UserFields.highestScore}, ${UserFields.scoreDate}';
    // final values =
    //     '${json[UserFields.username]}, ${json[UserFields.highestScore]}, ${json[UserFields.scoreDate]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableUsers, user.toJson());
    return user.copy(id: id);
  }

  Future<User> readUser(int id) async {
    final db = await  instance.database;

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

  Future<List<User>> readAllUsers() async {
    final db = await instance.database;

    final result = await db.query(tableUsers);
    return result.map((json) => User.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
