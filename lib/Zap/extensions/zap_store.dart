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
  Future<String?>? getString(String key) => JsonDataStore()._getString(key);

  /// Retrieves an integer value associated with the specified key.
  Future<int?>? getInt(String key) => JsonDataStore()._getInt(key);

  /// Retrieves a boolean value associated with the specified key.
  Future<bool?>? getBool(String key) => JsonDataStore()._getBool(key);

  /// Retrieves a list of strings associated with the specified key.
  Future<List<String>?>? getStringList(String key) =>
      JsonDataStore()._getStringList(key);

  /// Retrieves a map associated with the specified key.
  Future<Map?>? getMap(String key) => JsonDataStore()._getMap(key);

  /// Retrieves a double associated with the specified key.
  Future<double?>? getDouble(String key) => JsonDataStore()._getDouble(key);

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
    late Directory appDocumentsDirectory;
    if (Platform.isAndroid) {
      appDocumentsDirectory = await getApplicationCacheDirectory();
    } else {
      await getApplicationCacheDirectory();
    }
    return appDocumentsDirectory.path;
  }

  /// Loads data from the JSON file into the internal data structure.
  Future<bool?>? _loadData() async {
    String _filePath = '${await _getAppPath()}/zap_store.json';
    try {
      File file = File(_filePath);
      if (file.existsSync()) {
        String contents = file.readAsStringSync();
        _data = json.decode(contents);
        return true;
      }
    } catch (e, stackTrace) {
      print('Error loading data: $e');
      print(stackTrace);
    }
    return null;
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
  Future<Map?>? _getMap(String key) async {
    bool? have = await _loadData();
    if (have != null) return _data[key];
    return null;
  }

  Future<String?>? _getString(String key) async {
    bool? have = await _loadData();
    if (have != null) return _data[key];
    return null;
  }

  Future<bool?>? _getBool(String key) async {
    bool? have = await _loadData();
    if (have != null) return _data[key];
    return null;
  }

  Future<int?>? _getInt(String key) async {
  bool? have =   await _loadData();
   if (have != null) return _data[key];
   return null;
  }

  Future<double?>? _getDouble(String key) async {
   bool? have =  await _loadData();
  if (have != null)  return _data[key];
  return null;
  }

  Future<List<String>?>? _getStringList(String key) async {
   bool? have =  await _loadData();
if (have != null)     return _data[key];
return null;
  }
}
