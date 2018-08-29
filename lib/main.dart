import 'package:flutter/material.dart';
import 'package:flutter_dice/pages/dice_page.dart';
import 'package:flutter_dice/providers/prefs_singleton.dart';
import 'package:flutter_dice/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  PrefsSingleton.prefs = await SharedPreferences.getInstance();

  runApp(DiceApp());
}

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      child: ResponsiveApp(),
    );
  }
}

class ResponsiveApp extends StatelessWidget {
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
