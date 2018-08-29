import 'dart:async';
import 'package:flutter_dice/providers/prefs_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class DiceBloc {
  DiceBloc(this.prefs) {
    var sides = prefs.getInt(PreferenceNames.sides) ?? 6;
    changeSides(sides);
  }

  // Regular variables
  SharedPreferences prefs;

  // Reactive variables
  final _roll = BehaviorSubject<int>();
  final _sides = BehaviorSubject<int>();

  // Streams
  Observable<int> get roll => _roll.stream;
  Observable<int> get sides => _sides.stream;

  // Sinks
  Function(int) get changeRoll => _roll.sink.add;

  // Functions
  Future changeSides(int sides) async {
    _sides.sink.add(sides);
    rollDice();
    prefs.setInt(PreferenceNames.sides, sides); // persist to disk
  }

  void rollDice() {
    var numberOfSides = _sides.value;
    var value = Random().nextInt(numberOfSides) + 1;
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
  }
}
