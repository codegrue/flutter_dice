import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dice/providers/prefs_singleton.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceNames {
  static const roll = "roll";
  static const sides = "sides";
}

class DiceModel with ChangeNotifier {
  DiceModel() {
    loadState();
  }

  final SharedPreferences _prefs = PrefsSingleton.prefs;

  int _roll;
  int _sides;

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
    var numberOfSides = sides;
    var value = Random().nextInt(numberOfSides) + 1;
    roll = value;
    await saveState();
  }

  void incrementDice() {
    int value = min(_roll + 1, _sides);
    if (value != null) roll = value;
  }

  void decrementDice() {
    int value = max(roll - 1, 1);
    if (value != null) roll = value;
  }

  // Persistence Functions
  Future saveState() async {
    await _prefs.setInt(PreferenceNames.sides, sides);
    await _prefs.setInt(PreferenceNames.roll, roll);
  }

  void loadState() {
    sides = (_prefs.getInt(PreferenceNames.sides) ?? 6);
    roll = (_prefs.getInt(PreferenceNames.roll) ?? 1);
  }
}
