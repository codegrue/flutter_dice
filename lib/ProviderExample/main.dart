import 'package:flutter/material.dart';
import 'package:flutter_dice/ProviderExample/pages/dice_page.dart';
import 'package:provider/provider.dart';

import 'models/dice_model.dart';
import 'models/theme_model.dart';

class ProviderMain extends StatelessWidget {
  final String appName = 'Flutter Dice';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DiceModel>(create: (_) => DiceModel()),
        ChangeNotifierProvider<ThemeModel>(create: (_) => ThemeModel()),
      ],
      child: Builder(
        // Builder required to allow MaterialApp to access providers
        builder: (context) {
          return MaterialApp(
            title: appName,
            theme: Provider.of<ThemeModel>(context).data,
            home: DicePage(title: appName),
          );
        },
      ),
    );
  }
}
