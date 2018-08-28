import 'package:flutter/material.dart';
import 'package:flutter_dice/pages/dice_page.dart';
import 'package:flutter_dice/providers/state_provider.dart';

void main() => runApp(StatefulWrapper());

class StatefulWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateProvider(
      child: ThemeableApp(),
    );
  }
}

class ThemeableApp extends StatelessWidget {
  final String appName = 'Flutter Dice';

  @override
  Widget build(BuildContext context) {
    var stateBloc = StateProvider.of(context);
    return StreamBuilder(
      stream: stateBloc.theme,
      builder: (content, snapshot) {
        return MaterialApp(
          title: appName,
          theme: snapshot.data,
          home: DicePage(title: appName),
        );
      },
    );
  }
}
