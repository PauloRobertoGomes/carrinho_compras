import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_storage_service.g.dart';

@Injectable()
class LocalStorageService extends Disposable {
  //dispose will be called automatically

  Future<SharedPreferences> _prefs;

  LocalStorageService() {
    _init();
  }

  _init() {
    _prefs = SharedPreferences.getInstance();
  }

  Future<dynamic> getValue<T>(String key) async {
    SharedPreferences prefs = await _prefs;

    switch (T) {
      case double:
        return prefs.getDouble(key) ?? 0;
      case int:
        return prefs.getInt(key) ?? 0;
      case List:
        return prefs.getStringList(key) ?? [];
      case bool:
        return prefs.getBool(key) ?? false;
      case Map:
        var json = prefs.getString(key);
        return json != null ? jsonDecode(json) : null;
      default:
        return prefs.getString(key) ?? '';
    }
  }

  Future<bool> setValue<T>(String key, dynamic value) async {
    SharedPreferences prefs = await _prefs;

    switch (T) {
      case double:
        return prefs.setDouble(key, value);
      case int:
        return prefs.setInt(key, value);
      case List:
        return prefs.setStringList(key, value);
      case bool:
        return prefs.setBool(key, value);
      case Map:
        return prefs.setString(key, jsonEncode(value));
      default:
        return prefs.setString(key, value);
    }
  }

  Future<bool> cointains(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.containsKey(key);
  }

  Future<bool> delete(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.remove(key);
  }

  @override
  void dispose() {}
}
