import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_dice/prefs_singleton.dart';
import 'dart:math';

class PreferenceNames {
  static const roll = "roll";
  static const sides = "sides";
}

class StateBloc {
  StateBloc() {
    loadState();
  }

  // Reactive variables
  final _roll = BehaviorSubject<int>();
  final _sides = BehaviorSubject<int>();

  // Streams
  Stream<int> get roll => _roll.stream;
  Stream<int> get sides => _sides.stream;

  // Sinks
  Function(int) get changeRoll => _roll.sink.add;

  // Functions
  Future changeSides(int sides) async {
    _sides.sink.add(sides);
    rollDice();
  }

  void rollDice() {
    var numberOfSides = _sides.value;
    var value = Random().nextInt(numberOfSides) + 1;
    changeRoll(value);
    saveState();
  }

  void incrementDice() {
    int value = min(_roll.value + 1, _sides.value);
    if (value != null) changeRoll(value);
  }

  void decrementDice() {
    int value = max(_roll.value - 1, 1);
    if (value != null) changeRoll(value);
  }

  // Persistence Functions
  Future saveState() async {
    await PrefsSingleton.prefs?.setInt(PreferenceNames.sides, _sides.value);
    await PrefsSingleton.prefs?.setInt(PreferenceNames.roll, _roll.value);
  }

  void loadState() {
    _sides.value = (PrefsSingleton.prefs?.getInt(PreferenceNames.sides) ?? 6);
    _roll.value = (PrefsSingleton.prefs?.getInt(PreferenceNames.roll) ?? 1);
  }

  Future dispose() async {
    // cleanup
    _roll.close();
    _sides.close();
  }
}
