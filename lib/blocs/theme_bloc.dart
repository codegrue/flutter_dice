import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_dice/services/state_persist.dart';

enum ThemeType { light, dark }

class ThemeBloc {
  final persistState = PersistState();

  ThemeBloc() {
    init();
  }

  Future init() async {
    changeThemeType(await persistState.loadThemeType());
  }

  // Reactive variables
  final _theme = PublishSubject<ThemeData>();
  final _themeType = BehaviorSubject<ThemeType>();

  // Streams
  Observable<ThemeData> get theme => _theme.stream;
  Observable<ThemeType> get themeType => _themeType.stream;

  // Sinks
  Function(ThemeData) get changeTheme => _theme.sink.add;

  // Functions
  Future changeThemeType(ThemeType type) async {
    var theme = themeTypeToData(type);
    changeTheme(theme);
    _themeType.sink.add(type);
    persistState.saveTheme(type); // persist to disk
  }

  ThemeData themeTypeToData(ThemeType type) {
    return (type == ThemeType.light) ? ThemeData.light() : ThemeData.dark();
  }

  void flipTheme() {
    var newTheme =
        (_themeType.value == ThemeType.dark) ? ThemeType.light : ThemeType.dark;
    changeThemeType(newTheme);
  }

  Future dispose() async {
    // cleanup
    _theme.close();
    _themeType.close();
  }
}
