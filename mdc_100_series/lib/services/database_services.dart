import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


class DatabaseCredentials {
  static final DatabaseCredentials instance = DatabaseCredentials._constructor();
  DatabaseCredentials._constructor();

  static Database? _db;

static Future<Database> get database async {
  _db ??= await initDB();
  

  return _db!;

  
}

  static Future<Database> initDB() async {
 
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'appdata.db');


    return openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        // Users table
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fullname TEXT,
            email TEXT,
            username TEXT,
            password TEXT
          )
        ''');

        // printers table
        await db.execute('''
          CREATE TABLE printers (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            printerName TEXT,
            price TEXT,
            description TEXT
          )
        ''');

        // Cart table
        await db.execute('''
          CREATE TABLE cart (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            productName TEXT,
            quantity INTEGER,
            price REAL
          )
        ''');
      },
    );
  }

  // Insert user
  static Future<void> insertUser(Database db, String fullname, String email,String username, String password) async {
    await db.insert(
      'users',
      {
        'fullname': fullname,
        'email': email,
        'username': username,
        'password': password,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //Insert printer information
  static Future<void> insertPrinter(Database db, String printername, String price, String description) async {
    await db.insert(
      'printers',
      {
        'printerName': printername,
        'price': price,
        'description': description,   
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Insert cart item
  static Future<void> insertCartItem(Database db, String productName, int quantity, double price) async {
    await db.insert(
      'cart',
      {
        'productName': productName,
        'quantity': quantity,
        'price': price,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get all users
  static Future<List<Map<String, dynamic>>> getUsers(Database db) async {
    return await db.query('users');
  }

  // Get all cart items
  static Future<List<Map<String, dynamic>>> getCart(Database db) async {
    return await db.query('cart');
  }

  // Get all printers
  static Future<List<Map<String, dynamic >>> getPrinters(Database db) async {
    return await db.query('printers');
  }
}