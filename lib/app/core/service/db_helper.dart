// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:yoddhafoundation/app/constant/db_name.dart';

// YoddhaDatabase con = YoddhaDatabase.instance;

// class YoddhaDatabase {
//   YoddhaDatabase.internal();
//   static final YoddhaDatabase instance = YoddhaDatabase.internal();
//   factory YoddhaDatabase() => instance;
//   static const _version = 1;
//   static Database? _db;

//   Future<Database?> get db async {
//     if (_db != null) {
//       return _db;
//     }
//     _db = await initDb();
//     return _db;
//   }

//   Future<Database> initDb() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String dbPath = join('assets', DBname.dbname);

//     var openDb = await openDatabase(dbPath, version: _version,
//         onCreate: (Database db, int version) async {
//       for (var table in DBname.tableNames) {
//         await db.execute(table);
//       }
//     }, onUpgrade: (Database db, int oldversion, int newversion) async {
//       if (oldversion < newversion) {
//         print("version upgrade");
//       }
//     });
//     print("db initialize");
//     return openDb;
//   }
// }
