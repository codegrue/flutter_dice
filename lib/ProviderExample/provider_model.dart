import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dice/prefs_singleton.dart';
import 'dart:math';

import '../main.dart';

class ProviderModel with ChangeNotifier {
  ProviderModel() {
    loadState();
  }

  int _roll = 3;
  int _sides = 5;

  int get roll => _roll;
  int get sides => _sides;

  void set roll(int value) {
    _roll = value;
    notifyListeners();
  }

  void set sides(int value) {
    _sides = value;
    notifyListeners();
  }

  // Logic Functions
  Future changeSides(int value) async {
    sides = value;
    await rollDice();
  }

  Future rollDice() async {
    _delayedRoll(sides, 100);
    _delayedRoll(sides, 100);
    _delayedRoll(sides, 300);
    _delayedRoll(sides, 400);
    _delayedRoll(sides, 500);
  }

  void _delayedRoll(int sides, int delay) {
    Timer(Duration(milliseconds: delay), () {
      roll = Random().nextInt(sides) + 1;
      saveState();
    });
  }

  void incrementDice() {
    int value = min(_roll + 1, _sides);
    roll = value;
  }

  void decrementDice() {
    int value = max(roll - 1, 1);
    roll = value;
  }

  // Persistence Functions
  Future<bool> saveState() async {
    await PrefsSingleton.prefs?.setInt(PreferenceNames.sides, sides);
    await PrefsSingleton.prefs?.setInt(PreferenceNames.roll, roll);
    return true;
  }

  void loadState() {
    sides = (PrefsSingleton.prefs?.getInt(PreferenceNames.sides) ?? 6);
    roll = (PrefsSingleton.prefs?.getInt(PreferenceNames.roll) ?? 1);
  }
}
