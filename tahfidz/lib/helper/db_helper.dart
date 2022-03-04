// import 'package:sqflite/sqflite.dart';
// import 'dart:async';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:tahfidz/model/profil.dart';

// class DbHelper {
//   static DbHelper? _dbHelper;
//   static Database? _database;

//   DbHelper._createObject();

//   factory DbHelper() {
//     if (_dbHelper == null) {
//       _dbHelper = DbHelper._createObject();
//     }
//     return _dbHelper!;
//   }

//   Future<Future<Database>> initDb() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = directory.path + 'data.db';

//     var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);

//     return todoDatabase;
//   }

//   //buat tabel baru dengan nama contact
//   void _createDb(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE profil (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         username TEXT,
//         nama TEXT,
//         alamat TEXT,
//         kota TEXT,
//         telp TEXT
//     ''');
//   }

//   Future<Database> get database async {
//     if (_database == null) {
//       _database = await initDb();
//     }
//     return _database!;
//   }

//   Future<List<Map<String, dynamic>>> select() async {
//     Database db = await this.database;
//     var mapList = await db.query('profil', orderBy: 'nama');
//     return mapList;
//   }

//   Future<int> insert(Profil object) async {
//     Database db = await this.database;
//     db.execute('delete from profil');
//     int count = await db.insert('profil', object.toMap());
//     return count;
//   }

//   // Future<int> update(String nama, String alamat, String id) async {
//   //   Database db = await this.database;
//   //   db.execute(
//   //       'update profil set nama=?,alamat=? where id=?', [nama, alamat, id]);
//   //   int count = 1;
//   //   return count;
//   }

//   Future<int> delete(int id) async {
//     Database? db = await this.database;
//     int count = await db.delete('profil', where: 'id=?', whereArgs: [id]);
//     return count;
//   }

//   Future<List<Profil>> getProfil() async {
//     var profilMapList = await select();
//     int count = profilMapList.length;
//     List<Profil> profilList = <Profil>[];
//     for (int i = 0; i < count; i++) {
//       profilList.add(Profil.fromMap(profilMapList[i]));
//     }
//     return profilList;
//   }
// }

// mixin Database {
//   execute(String s) {}

//   delete(String s, {String? where, List<int>? whereArgs}) {}

//   insert(String s, Map<String, dynamic> map) {}

//   query(String s, {String? orderBy}) {}
// }
