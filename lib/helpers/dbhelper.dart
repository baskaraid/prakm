import 'package:sqflite/sqflite.dart';
import 'dart:async';
//mendukug pemrograman asinkron
import 'dart:io';
//bekerja pada file dan directory
import 'package:path_provider/path_provider.dart';
import 'package:crud_sqliteback1/models/content.dart';
//pubspec.yml

//kelass Dbhelper
class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;  

  DbHelper._createObject();

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> initDb() async {

  //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'employeeeee.db';

   //create, read databases
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);

    //mengembalikan nilai object sebagai hasil dari fungsinya
    return todoDatabase;
  }

    //buat tabel baru dengan nama contact
  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE contentnih (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        judul TEXT,
        foto TEXT,
        deskripsi TEXT
      )
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query('contentnih', orderBy: 'judul');
    return mapList;
  }

//create databases
  Future<int> insert(Content object) async {
    Database db = await this.database;
    int count = await db.insert('contentnih', object.toMap());
    return count;
  }
//update databases
  Future<int> update(Content object) async {
    Database db = await this.database;
    int count = await db.update('contentnih', object.toMap(), 
                                where: 'id=?',
                                whereArgs: [object.id]);
    return count;
  }

//delete databases
  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('contentnih', 
                                where: 'id=?', 
                                whereArgs: [id]);
    return count;
  }

  Future<List<Content>> getContentList() async {
    var contentMapList = await select();
    int count = contentMapList.length;
    List<Content> contentList = List<Content>();
    for (int i=0; i<count; i++) {
      contentList.add(Content.fromMap(contentMapList[i]));
    }
    return contentList;
  }

}