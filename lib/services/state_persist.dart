import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dice/blocs/state_bloc.dart';
import 'dart:async';

enum Prefs { Sides, ThemeType }

class PersistState {
  SharedPreferences prefs;

  Future init() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
  }

  Future saveSides(int sides) async {
    await init();
    prefs.setInt(Prefs.Sides.toString(), sides);
  }

  Future saveTheme(ThemeType themeType) async {
    await init();
    prefs.setString(Prefs.ThemeType.toString(), themeType.toString());
  }

  Future<int> loadSides() async {
    await init();
    return prefs.getInt(Prefs.Sides.toString()) ?? 6;
  }

  Future<ThemeType> loadThemeType() async {
    await init();
    var themePref = prefs.getString(Prefs.ThemeType.toString()) ??
        ThemeType.Light.toString();
    return (themePref == ThemeType.Light.toString())
        ? ThemeType.Light
        : ThemeType.Dark;
  }
}
