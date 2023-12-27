// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// `ZapStore` is a simple local storage solution using SQLite in Flutter.
/// It provides methods for basic CRUD operations (Create, Read, Update, Delete)
/// on a SQLite database.

class ZapStore {
  /// Private static variable to hold the reference to the database.
  static late Database _database;

  /// Initializes the SQLite database and creates the necessary table if it doesn't exist.
  static Future<void> _initializeDatabase() async {
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'zap_store.db'),
      onCreate: (db, version) {
        // Creates the 'database' table with columns 'id', 'key', and 'value'.
        return db.execute(
          'CREATE TABLE database(id INTEGER PRIMARY KEY AUTOINCREMENT, key TEXT, value TEXT)',
        );
      },
      version: 1,
    );
    // Assigns the opened database to the private static variable.
    _database = await database;
  }

  /// Inserts a key-value pair into the database.
  static Future<bool> insert(String key, dynamic value) async {
    await _initializeDatabase();
    // Encodes the dynamic value to a JSON-encoded string.
    var valueEnCode = json.encode(value);
    // Inserts or replaces the key-value pair in the 'database' table.
    await _database.insert(
      'database',
      {'key': key, 'value': valueEnCode},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    // Returns true to indicate the successful insertion.
    return true;
  }

  /// Retrieves the value associated with a given key from the database.
  static Future<dynamic> get(String key) async {
    await _initializeDatabase();
    // Queries the 'database' table for a specific key.
    List<Map<String, dynamic>> result = await _database.query(
      'database',
      where: 'key = ?',
      whereArgs: [key],
    );

    // Checks if the result is not empty.
    if (result.isNotEmpty) {
      // Decodes the JSON-encoded value and returns it.
      var _value = result.first['value'];
      return jsonDecode(_value);
    } else {
      // Returns null if the key is not found in the database.
      return null;
    }
  }

  /// Deletes a key-value pair from the database based on the key.
  static Future<void> delete(String key) async {
    await _initializeDatabase();
    // Deletes the key-value pair from the 'database' table based on the key.
    await _database.delete(
      'database',
      where: 'key = ?',
      whereArgs: [key],
    );
  }

  /// Updates the value associated with a given key in the database.
  static Future<void> update(String key, dynamic newValue) async {
    await _initializeDatabase();
    // Updates the 'value' column in the 'database' table for a specific key.
    await _database.update(
      'database',
      {'value': json.encode(newValue)},
      where: 'key = ?',
      whereArgs: [key],
    );
  }
}
