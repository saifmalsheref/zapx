// ignore_for_file: no_leading_underscores_for_local_identifiers, library_private_types_in_public_api, avoid_print, unused_element

import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

_ZapStore zapStore = _ZapStore();

/// The ZapStore class provides a simple interface to interact with a JSON data store.
///
/// It exposes methods for retrieving data (getString, getInt, getBool, getStringList, getMap),
/// as well as adding (add) and deleting (delete) key-value pairs in an asynchronous manner.
class _ZapStore {
  /// Retrieves a string value associated with the specified key.
  String? getString(String key) => JsonDataStore()._getValue(key);

  /// Retrieves an integer value associated with the specified key.
  int? getInt(String key) => JsonDataStore()._getValue(key);

  /// Retrieves a boolean value associated with the specified key.
  bool? getBool(String key) => JsonDataStore()._getValue(key);

  /// Retrieves a list of strings associated with the specified key.
  List? getStringList(String key) => JsonDataStore()._getValue(key);

  /// Retrieves a map associated with the specified key.
  Map? getMap(String key) => JsonDataStore()._getValue(key);

  /// Deletes the key-value pair associated with the specified key.
  ///
  /// Returns a Future<bool> indicating whether the operation was successful.
  Future<bool> delete(String key) => JsonDataStore()._delete(key);

  /// Adds or updates a key-value pair with the specified key and value.
  ///
  /// Returns a Future<bool> indicating whether the operation was successful.
  Future<bool> add(String key, String value) =>
      JsonDataStore()._add(key, value);
}

/// The JsonDataStore class manages the underlying data storage operations.
class JsonDataStore {
  Map<String, dynamic> _data = {};

  /// Initializes the JsonDataStore and loads data from the JSON file.
  JsonDataStore() {
    _loadData();
  }

  /// Retrieves the application directory path where the JSON file is stored.
  Future<String> _getAppPath() async {
    final appDocumentsDirectory = await getApplicationCacheDirectory();
    return appDocumentsDirectory.path;
  }

  /// Loads data from the JSON file into the internal data structure.
  void _loadData() async {
    String _filePath = '${await _getAppPath()}/zap_store.json';
    try {
      File file = File(_filePath);
      if (file.existsSync()) {
        String contents = file.readAsStringSync();
        _data = json.decode(contents);
      }
    } catch (e, stackTrace) {
      print('Error loading data: $e');
      print(stackTrace);
    }
  }

  /// Saves the internal data structure to the JSON file.
  ///
  /// Returns a Future<bool> indicating whether the operation was successful.
  Future<bool> _saveData() async {
    String _filePath = '${await _getAppPath()}/zap_store.json';
    try {
      File file = File(_filePath);
      await file.writeAsString(json.encode(_data));
      return true; // Assuming success, you can modify this based on your requirements
    } catch (e, stackTrace) {
      print('Error saving data: $e');
      print(stackTrace);
      return false; // Failed to save data
    }
  }

  /// Adds a key-value pair to the internal data structure and saves it to the JSON file.
  ///
  /// Returns a Future<bool> indicating whether the operation was successful.
  Future<bool> _add(String key, dynamic value) async {
    _data[key] = value;
    await _saveData();
    return true; // Assuming success, you can modify this based on your requirements
  }

  /// Deletes a key-value pair from the internal data structure and saves the changes to the JSON file.
  ///
  /// Returns a Future<bool> indicating whether the operation was successful.
  Future<bool> _delete(String key) async {
    _data.remove(key);
    await _saveData();
    return true; // Assuming success, you can modify this based on your requirements
  }

  /// Retrieves the value associated with a key from the internal data structure.
  dynamic _getValue(String key) {
    return _data[key];
  }
}
