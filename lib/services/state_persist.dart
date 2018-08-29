import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dice/blocs/theme_bloc.dart';
import 'dart:async';

enum Prefs { sides, themeType }

class PersistState {
  SharedPreferences prefs;

  Future init() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
  }

  Future saveSides(int sides) async {
    await init();
    prefs.setInt(Prefs.sides.toString(), sides);
  }

  Future saveTheme(ThemeType themeType) async {
    await init();
    prefs.setString(Prefs.themeType.toString(), themeType.toString());
  }

  Future<int> loadSides() async {
    await init();
    return prefs.getInt(Prefs.sides.toString()) ?? 6;
  }

  Future<ThemeType> loadThemeType() async {
    await init();
    var themePref = prefs.getString(Prefs.themeType.toString()) ??
        ThemeType.light.toString();
    return (themePref == ThemeType.light.toString())
        ? ThemeType.light
        : ThemeType.dark;
  }
}
