
import 'package:bullet_comments/db_bullet/bullet_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBBullet extends GetxService {
  late Database dbBase;

  Future<DBBullet> init() async {
    await createBulletDB();
    return this;
  }

  createBulletDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'bullet.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createBulletTable(db);
        });
  }

  createBulletTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS bullet (id INTEGER PRIMARY KEY, createdTime TEXT, content TEXT, wordColor TEXT, bgColor INTEGER, fontFamily INTEGER)');
  }

  insertBullet(BulletEntity entity) async {
    final id = await dbBase.insert('bullet', {
      'createdTime': entity.createdTime.toIso8601String(),
      'content': entity.content,
      'wordColor': entity.wordColor,
      'bgColor': entity.bgColor,
      'fontFamily': entity.fontFamily,
    });
    return id;
  }

  cleanAllData() async {
    await dbBase.delete('bullet');
  }

  Future<List<BulletEntity>> getBulletAllData() async {
    var result = await dbBase.query('bullet', orderBy: 'createdTime DESC');
    return result.map((e) => BulletEntity.fromJson(e)).toList();
  }
}
