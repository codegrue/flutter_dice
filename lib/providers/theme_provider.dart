import 'package:flutter/material.dart';
import 'package:flutter_dice/blocs/theme_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends InheritedWidget {
  ThemeProvider({Key key, Widget child, SharedPreferences prefs})
      : themeBloc = ThemeBloc(prefs),
        super(key: key, child: child);

  final ThemeBloc themeBloc;

  @override
  bool updateShouldNotify(_) => true;

  static ThemeBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ThemeProvider)
            as ThemeProvider)
        .themeBloc;
  }
}
