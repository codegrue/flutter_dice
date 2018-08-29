import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dice/models/preference_names.dart';
import 'package:flutter_dice/providers/prefs_singleton.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType { light, dark }

class ThemeBloc {
  ThemeBloc() {
    loadState();
  }

  // Regular variables
  final SharedPreferences prefs = PrefsSingleton.prefs;

  // Reactive variables
  final _theme = PublishSubject<ThemeData>();
  final _themeType = BehaviorSubject<ThemeType>();

  // Streams
  Observable<ThemeData> get theme => _theme.stream;
  Observable<ThemeType> get themeType => _themeType.stream;

  // Sinks
  Function(ThemeData) get _changeTheme => _theme.sink.add;
  Function(ThemeType) get _changeThemeType => _themeType.sink.add;

  // Logic Functions
  Future changeTheme(ThemeType type) async {
    var theme = themeTypeToData(type);
    _changeTheme(theme);
    _changeThemeType(type);
    await saveState(type);
  }

  void flipTheme() {
    var newTheme =
        (_themeType.value == ThemeType.dark) ? ThemeType.light : ThemeType.dark;
    changeTheme(newTheme);
  }

  ThemeData themeTypeToData(ThemeType type) {
    return (type == ThemeType.light) ? ThemeData.light() : ThemeData.dark();
  }

  // Persistence Functions
  Future saveState(ThemeType themeType) async {
    await prefs.setString(
        PreferenceNames.themeType, _themeType.value.toString());
  }

  ThemeData loadState() {
    var themePref = prefs.getString(PreferenceNames.themeType) ??
        ThemeType.light.toString();
    var type = (themePref == ThemeType.light.toString())
        ? ThemeType.light
        : ThemeType.dark;
    _changeThemeType(type);
    var theme = themeTypeToData(type);
    _changeTheme(theme);
    return theme;
  }

  Future dispose() async {
    // cleanup
    _theme.close();
    _themeType.close();
  }
}
