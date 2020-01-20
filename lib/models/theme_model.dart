import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dice/providers/prefs_singleton.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType { light, dark }

class PreferenceNames {
  static const themeType = "theme_type";
}

class ThemeModel with ChangeNotifier {
  ThemeModel() {
    loadState();
  }

  final SharedPreferences _prefs = PrefsSingleton.prefs;

  ThemeData _data;
  ThemeType _type;

  ThemeData get data => _data;
  ThemeType get type => _type;

  void set data(ThemeData value) {
    _data = value;
    notifyListeners();
  }

  void set type(ThemeType value) {
    _type = value;
    data = themeTypeToData(_type);
    saveState(_type);
    notifyListeners();
  }

  void flipTheme() {
    var newTheme = (_type == ThemeType.dark) ? ThemeType.light : ThemeType.dark;
    type = newTheme;
  }

  ThemeData themeTypeToData(ThemeType type) {
    return (type == ThemeType.light) ? ThemeData.light() : ThemeData.dark();
  }

  // Persistence Functions
  Future saveState(ThemeType themeType) async {
    await _prefs.setString(PreferenceNames.themeType, _type.toString());
  }

  ThemeData loadState() {
    var themePref = _prefs.getString(PreferenceNames.themeType) ??
        ThemeType.light.toString();
    var type = (themePref == ThemeType.light.toString())
        ? ThemeType.light
        : ThemeType.dark;
    type = type;
    data = themeTypeToData(type);
    return data;
  }
}
