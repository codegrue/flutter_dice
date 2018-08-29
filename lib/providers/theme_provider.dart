import 'package:flutter/material.dart';
import 'package:flutter_dice/blocs/theme_bloc.dart';

class ThemeProvider extends InheritedWidget {
  ThemeProvider({Key key, Widget child}) : super(key: key, child: child);

  final ThemeBloc themeBloc = ThemeBloc();

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) =>
      (oldWidget.themeBloc != themeBloc);

  static ThemeBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ThemeProvider)
            as ThemeProvider)
        .themeBloc;
  }
}
