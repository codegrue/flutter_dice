import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dice/prefs_singleton.dart';
import 'dart:math';

class PreferenceNames {
  static const roll = "roll";
  static const sides = "sides";
}

class BlocProvider extends InheritedWidget {
  BlocProvider({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final BlocModel stateBloc = BlocModel();

  @override
  bool updateShouldNotify(_) => true;

  static BlocModel of(BuildContext context) {
    var provider = context.dependOnInheritedWidgetOfExactType<BlocProvider>();

    return (provider == null) ? BlocModel() : provider.stateBloc;
  }
}

class BlocModel {
  BlocModel() {
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
    _delayedRoll(numberOfSides, 100);
    _delayedRoll(numberOfSides, 100);
    _delayedRoll(numberOfSides, 300);
    _delayedRoll(numberOfSides, 400);
    _delayedRoll(numberOfSides, 500);
    saveState();
  }

  void _delayedRoll(int sides, int delay) {
    Timer(Duration(milliseconds: delay), () {
      var roll = Random().nextInt(sides) + 1;
      changeRoll(roll);
    });
  }

  void incrementDice() {
    int value = min(_roll.value + 1, _sides.value);
    changeRoll(value);
  }

  void decrementDice() {
    int value = max(_roll.value - 1, 1);
    changeRoll(value);
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
