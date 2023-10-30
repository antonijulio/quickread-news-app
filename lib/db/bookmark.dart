import 'package:quickread/model/bookmark_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbBookmarkManager {
  static DbBookmarkManager? _dbBookmarkManager;
  static late Database _db;

  DbBookmarkManager._private() {
    _dbBookmarkManager = this;
  }

  factory DbBookmarkManager() =>
      _dbBookmarkManager ?? DbBookmarkManager._private();

  Future<Database> get db async {
    _db = await _initDb();
    return _db;
  }

  Future<Database> _initDb() async {
    try {
      // todo CREATE DATABASE
      var database = openDatabase(
        join(
          await getDatabasesPath(),
          "bookmark.db",
        ),
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE bookmark(id TEXT PRIMARY KEY, '
            'link TEXT, '
            'title TEXT, '
            'imageUrl TEXT)',
          );
        },
        version: 1,
      );
      return database;
    } catch (e) {
      print("Error initializing database: $e");
      rethrow; // Re-throw kesalahan agar dapat ditangani
    }
  }

  // todo: INSERT BOOKMARK
  Future<void> insertBookmark(BookmarkModel bookmarkModel) async {
    final database = await db;
    await database.insert('bookmark', bookmarkModel.toMap());

    print(database.toString());
  }

  // todo: GET BOOKMARK BY ID
  Future<BookmarkModel> getBokmarkById(String id) async {
    final database = await db;
    List<Map<String, dynamic>> result = await database.query(
      "bookmark",
      where: "id = ?",
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return result.map((e) => BookmarkModel.fromMap(e)).toList().first;
    } else {
      return BookmarkModel();
    }
  }

  // todo: DELETE BOOKMARK BY ID
  Future<void> deleteBookmark(String id) async {
    final database = await db;
    await database.delete(
      "bookmark",
      where: "id = ?",
      whereArgs: [id],
    );
  }

  // todo: GET BOOKMARK FOR LISTVIEW IN WIDGET CLASS
  Future<List<BookmarkModel>> getListBookmark() async {
    final database = await db;
    List<Map<String, dynamic>> result = await database.query(
      "bookmark",
    );

    return result.map((e) => BookmarkModel.fromMap(e)).toList();
  }
}
