import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_dice/services/state_persist.dart';
import 'dart:math';

enum ThemeType { Light, Dark }

class StateBloc {
  final persistState = PersistState();

  StateBloc() {
    init();
  }

  Future init() async {
    changeSides(await persistState.loadSides());
    changeThemeType(await persistState.loadThemeType());
  }

  // Reactive variables
  final _roll = BehaviorSubject<int>();
  final _sides = BehaviorSubject<int>();
  final _theme = PublishSubject<ThemeData>();
  final _themeType = BehaviorSubject<ThemeType>();

  // Streams
  Observable<int> get roll => _roll.stream;
  Observable<int> get sides => _sides.stream;
  Observable<ThemeData> get theme => _theme.stream;
  Observable<ThemeType> get themeType => _themeType.stream;

  // Sinks
  Function(int) get changeRoll => _roll.sink.add;
  Function(ThemeData) get changeTheme => _theme.sink.add;

  // Functions
  Future changeThemeType(ThemeType type) async {
    var theme =
        (type == ThemeType.Light) ? ThemeData.light() : ThemeData.dark();
    changeTheme(theme);
    _themeType.sink.add(type);
    persistState.saveTheme(type); // persist to disk
  }

  void flipTheme() {
    var newTheme =
        (_themeType.value == ThemeType.Dark) ? ThemeType.Light : ThemeType.Dark;
    changeThemeType(newTheme);
  }

  Future changeSides(int sides) async {
    _sides.sink.add(sides);
    rollDice();
    persistState.saveSides(sides); // persist to disk
  }

  void rollDice() {
    var numberOfSides = _sides.value;
    var value = new Random().nextInt(numberOfSides) + 1;
    changeRoll(value);
  }

  void incrementDice() {
    int value = min(_roll.value + 1, _sides.value);
    if (value != null) changeRoll(value);
  }

  void decrementDice() {
    int value = max(_roll.value - 1, 1);
    if (value != null) changeRoll(value);
  }

  Future dispose() async {
    // cleanup
    _roll.close();
    _sides.close();
    _theme.close();
    _themeType.close();
  }
}
