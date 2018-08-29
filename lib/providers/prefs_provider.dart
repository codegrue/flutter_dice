import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceNames {
  static const roll = "roll";
  static const sides = "sides";
  static const themeType = "theme_type";
}

class PrefsProvider extends InheritedWidget {
  PrefsProvider({
    @required this.prefs,
    Key key,
    Widget child,
  }) : super(key: key, child: child);

  final SharedPreferences prefs;

  @override
  bool updateShouldNotify(PrefsProvider oldWidget) =>
      (oldWidget.prefs != prefs);

  static SharedPreferences of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(PrefsProvider)
            as PrefsProvider)
        .prefs;
  }
}
