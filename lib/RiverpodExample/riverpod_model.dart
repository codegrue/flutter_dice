import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dice/prefs_singleton.dart';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreferenceNames {
  static const roll = "roll";
  static const sides = "sides";
}

@immutable
class DiceState {
  const DiceState({
    required this.roll,
    required this.sides,
  });

  final int roll;
  final int sides;

  DiceState copyWith({int? roll, int? sides}) =>
      DiceState(roll: roll ?? this.roll, sides: sides ?? this.sides);

  // Persistence Functions
  static DiceState loadState() {
    int sides = (PrefsSingleton.prefs?.getInt(PreferenceNames.sides) ?? 6);
    int roll = (PrefsSingleton.prefs?.getInt(PreferenceNames.roll) ?? 1);
    return DiceState(roll: roll, sides: sides);
  }

  Future saveState() async {
    await PrefsSingleton.prefs?.setInt(PreferenceNames.sides, sides);
    await PrefsSingleton.prefs?.setInt(PreferenceNames.roll, roll);
  }
}

class RiverpodNotifier extends StateNotifier<DiceState> {
  RiverpodNotifier() : super(DiceState.loadState());

  // Logic Functions
  Future changeSides(int value) async {
    state = state.copyWith(sides: value);
    await rollDice();
  }

  Future rollDice() async {
    var sides = state.sides;
    _delayedRoll(sides, 100);
    _delayedRoll(sides, 100);
    _delayedRoll(sides, 300);
    _delayedRoll(sides, 400);
    _delayedRoll(sides, 500);
  }

  void _delayedRoll(int sides, int delay) {
    Timer(Duration(milliseconds: delay), () {
      int value = Random().nextInt(sides) + 1;
      state = state.copyWith(roll: value);
      state.saveState();
    });
  }

  void incrementDice() {
    int value = min(state.roll + 1, state.sides);
    state = state.copyWith(roll: value);
    state.saveState();
  }

  void decrementDice() {
    int value = max(state.roll - 1, 1);
    state = state.copyWith(roll: value);
    state.saveState();
  }
}
