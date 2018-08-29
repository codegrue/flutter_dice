import 'dart:async';
import 'package:flutter_dice/models/preference_names.dart';
import 'package:flutter_dice/providers/prefs_singleton.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class DiceBloc {
  DiceBloc() {
    loadState();
  }

  // Regular variables
  final SharedPreferences prefs = PrefsSingleton.prefs;

  // Reactive variables
  final _roll = BehaviorSubject<int>();
  final _sides = BehaviorSubject<int>();

  // Streams
  Observable<int> get roll => _roll.stream;
  Observable<int> get sides => _sides.stream;

  // Sinks
  Function(int) get _changeRoll => _roll.sink.add;
  Function(int) get _changeSides => _sides.sink.add;

  // Logic Functions
  Future changeSides(int sides) async {
    _changeSides(sides);
    await rollDice();
  }

  Future rollDice() async {
    var numberOfSides = _sides.value;
    var value = Random().nextInt(numberOfSides) + 1;
    _changeRoll(value);
    await saveState();
  }

  void incrementDice() {
    int value = min(_roll.value + 1, _sides.value);
    if (value != null) _changeRoll(value);
  }

  void decrementDice() {
    int value = max(_roll.value - 1, 1);
    if (value != null) _changeRoll(value);
  }

  // Persistence Functions
  Future saveState() async {
    await prefs.setInt(PreferenceNames.sides, _sides.value);
    await prefs.setInt(PreferenceNames.roll, _roll.value);
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
