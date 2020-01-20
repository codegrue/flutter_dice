import 'package:flutter/material.dart';
import 'package:flutter_dice/pages/dice_page.dart';
import 'package:flutter_dice/providers/prefs_singleton.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/dice_model.dart';
import 'models/theme_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PrefsSingleton.prefs = await SharedPreferences.getInstance();

  runApp(DiceApp());
}

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DiceModel>(create: (_) => DiceModel()),
        ChangeNotifierProvider<ThemeModel>(create: (_) => ThemeModel()),
      ],
      child: ResponsiveApp(),
    );
  }
}

class ResponsiveApp extends StatelessWidget {
  final String appName = 'Flutter Dice';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: Provider.of<ThemeModel>(context).data,
      home: DicePage(title: appName),
    );
  }
}
