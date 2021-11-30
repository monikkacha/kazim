import 'package:project_beta/db/table/draft_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {

  DB._init();

  static final DB instance = DB._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes.db');
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
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableDraft ( 
  ${DraftTableFields.id} $idType, 
  ${DraftTableFields.category} $textType,
  ${DraftTableFields.subject} $textType,
  ${DraftTableFields.description} $textType,
  ${DraftTableFields.title} $textType,
  )
''');
  }

  Future<bool> createDraft(DraftModel draft) async {
    final db = await instance.database;
    final id = await db.insert(tableDraft, draft.toJson());
    return id != null ? true : false;
  }

  Future<DraftModel> readSingleDraft(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableDraft,
      columns: DraftTableFields.values,
      where: '${DraftTableFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return DraftModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  // Future<List<DraftModel>?> readAllDrafts() async {
  //   final db = await instance.database;
  //   final result = await db.query(tableDraft);
  //   return result.map((json) => DraftModel.fromJson(json)).toList();
  // }

  Future<int> updateDraft(DraftModel note) async {
    final db = await instance.database;
    return db.update(
      tableDraft,
      note.toJson(),
      where: '${DraftTableFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableDraft,
      where: '${DraftTableFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
