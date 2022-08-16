import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dice/prefs_singleton.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType { light, dark, system }

class PreferenceNames {
  static const themeType = "theme_type";
}

//https://medium.com/@pmutisya/dark-mode-in-flutter-3742062f9f59
class ThemeModel with ChangeNotifier, WidgetsBindingObserver {
  ThemeModel() {
    WidgetsBinding.instance.addObserver(
        this); // Respond to brightness changes (i.e. switch to/from dark mode)
    loadState();
  }

  final SharedPreferences _prefs = PrefsSingleton.prefs;

  ThemeData _data;
  ThemeType _type;
  ThemeType _effectiveType;

  ThemeData get data => _data;
  ThemeType get type => _type;
  ThemeType get effectiveType => _effectiveType; // type sans "system"

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    _refreshData(_type);
  }

  void set data(ThemeData value) {
    _data = value;
    notifyListeners();
  }

  void set type(ThemeType value) {
    _type = value;
    _refreshData(value);
  }

  void _refreshData(ThemeType type) {
    data = themeTypeToData(type);
    saveState();
    notifyListeners();
  }

  ThemeData themeTypeToData(ThemeType type) {
    _effectiveType = type;

    // if "system", determine an explicit type (light or dark)
    if (_effectiveType == ThemeType.system) {
      Brightness brightness = WidgetsBinding.instance.window.platformBrightness;
      if (brightness == Brightness.light) {
        _effectiveType = ThemeType.light;
      } else {
        _effectiveType = ThemeType.dark;
      }
    }

    return (_effectiveType == ThemeType.light)
        ? ThemeData.light()
        : ThemeData.dark();
  }

  // Persistence Functions
  Future saveState() async {
    await _prefs.setString(PreferenceNames.themeType, _type.toString());
  }

  void loadState() {
    var themePref = _prefs.getString(PreferenceNames.themeType) ??
        ThemeType.light.toString();

    type = ThemeType.values.firstWhere((e) => e.toString() == themePref);
  }
}
