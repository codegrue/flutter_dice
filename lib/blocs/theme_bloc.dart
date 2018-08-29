import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dice/providers/prefs_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType { light, dark }

class ThemeBloc {
  ThemeBloc(this.prefs);

  // Regular variables
  SharedPreferences prefs;

  // Reactive variables
  final _theme = PublishSubject<ThemeData>();
  final _themeType = BehaviorSubject<ThemeType>();

  // Streams
  Observable<ThemeData> get theme => _theme.stream;
  Observable<ThemeType> get themeType => _themeType.stream;

  // Sinks
  Function(ThemeData) get changeTheme => _theme.sink.add;

  // Logic Functions
  Future changeThemeType(ThemeType type) async {
    var theme = themeTypeToData(type);
    changeTheme(theme);
    _themeType.sink.add(type);
    saveThemeType(type); // persist to disk
  }

  void flipTheme() {
    var newTheme =
        (_themeType.value == ThemeType.dark) ? ThemeType.light : ThemeType.dark;
    changeThemeType(newTheme);
  }

  ThemeData themeTypeToData(ThemeType type) {
    return (type == ThemeType.light) ? ThemeData.light() : ThemeData.dark();
  }

  // Persistence Functions
  Future saveThemeType(ThemeType themeType) async {
    prefs.setString(PreferenceNames.themeType, themeType.toString());
  }

  ThemeData loadTheme() {
    var themePref = prefs.getString(PreferenceNames.themeType) ??
        ThemeType.light.toString();
    var type = (themePref == ThemeType.light.toString())
        ? ThemeType.light
        : ThemeType.dark;
    return themeTypeToData(type);
  }

  Future dispose() async {
    // cleanup
    _theme.close();
    _themeType.close();
  }
}
