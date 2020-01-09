import 'dart:async';
import 'package:flutter_dice/models/preference_names.dart';
import 'package:flutter_dice/providers/prefs_singleton.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class DiceBloc {
  // Regular variables
  final SharedPreferences prefs = PrefsSingleton.prefs;

  // Reactive variables
  final _roll = BehaviorSubject<int>();
  final _sides = BehaviorSubject<int>();

  DiceBloc() {
    loadState();
    // Save states on new value
    _sides.stream.listen((_) => saveSides());
    _roll.stream.listen((_) => saveRoll());
  }

  // Saving state functions
  Future saveRoll() => prefs.setInt(PreferenceNames.roll, _roll.value);
  Future saveSides() => prefs.setInt(PreferenceNames.sides, _sides.value);

  // Streams
  Observable<int> get roll => _roll.stream;
  Observable<int> get sides => _sides.stream;

  // Sinks
  Function(int) get _changeRoll => _roll.sink.add;
  Function(int) get _changeSides => _sides.sink.add;

  // Logic Functions
  void changeSides(int sides) {
    _changeSides(sides);
    rollDice();
  }

  void rollDice() {
    var numberOfSides = _sides.value;
    var value = Random().nextInt(numberOfSides) + 1;
    _changeRoll(value);
  }

  void incrementDice() {
    int value = min(_roll.value + 1, _sides.value);
    if (value != null) _changeRoll(value);
  }

  void decrementDice() {
    int value = max(_roll.value - 1, 1);
    if (value != null) _changeRoll(value);
  }

  void loadState() {
    _changeSides(prefs.getInt(PreferenceNames.sides) ?? 6);
    _changeRoll(prefs.getInt(PreferenceNames.roll) ?? 1);
  }

  Future dispose() async {
    // cleanup
    _roll.close();
    _sides.close();
  }
}
