import 'package:flutter/material.dart';
import 'package:flutter_dice/pages/dice_page.dart';
import 'package:flutter_dice/providers/prefs_provider.dart';
import 'package:flutter_dice/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(MyApp(
    sharedPreferences,
  ));
}

class MyApp extends StatelessWidget {
  MyApp(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return PrefsProvider(
      prefs: sharedPreferences,
      child: ThemeProvider(
        prefs: sharedPreferences,
        child: ThemeableApp(),
      ),
    );
  }
}

class ThemeableApp extends StatelessWidget {
  final String appName = 'Flutter Dice';

  @override
  Widget build(BuildContext context) {
    var themeBloc = ThemeProvider.of(context);
    return StreamBuilder(
      initialData: themeBloc.loadState(),
      stream: themeBloc.theme,
      builder: (content, snapshot) {
        ThemeData theme = snapshot.data;
        return MaterialApp(
          title: appName,
          theme: theme,
          home: DicePage(title: appName),
        );
      },
    );
  }
}
