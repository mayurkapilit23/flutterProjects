import 'package:sqflite/sqflite.dart';

class DBHelper {
  //singleton class

  DBHelper._();

  static DBHelper getInstance() {
    return DBHelper._();
  }

  Database? mydb;

  Database getDB() {
    if (mydb != null) {
      return mydb!;
    } else {
      mydb = openDB();
      return mydb!;
    }
  }

  Database openDB() {}
  //db open (path-> if exits then open else create db)

  //all quires
}
