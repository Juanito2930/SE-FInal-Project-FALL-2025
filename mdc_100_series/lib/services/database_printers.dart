//Database for Printers

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseService{
    static Database? _db;
    static final DatabaseService instance = DatabaseService._constructor(); 

    final String _PrinterTableName = "Printers";
    final String _PrinterIDColumName = "id";
    final String _PrinterContentColumName = 'content';
    final String _PrinterStatusColumnName = 'status';

    DatabaseService._constructor();

    Future<Database> get database async{
      if (_db != null) return _db!;
        _db = await getDatabase();
        return _db!;
      }
      
    Future<Database> getDatabase() async {
      final databaseDirPath = await getDatabasesPath();
      final databasePath = join(databaseDirPath, "master_db.db");
      final database = await openDatabase(
        databasePath,
        version: 1,
        onCreate: (db, version){
          db.execute('''
          CREATE TABLE $_PrinterTableName (
            $_PrinterIDColumName INTEGER PRRIMARY KEY,
            $_PrinterContentColumName TEXT NOT NULL,
            $_PrinterStatusColumnName INTEGER NOT NULL,
          )
          ''');
        },
       );
       return database;
    }
    void addPrinter(String content,) async{
      final db = await database;
      await db.insert( 
          _PrinterTableName,
          {
            _PrinterContentColumName: content,
            _PrinterStatusColumnName: 0,
          },
      );
    }
    
}