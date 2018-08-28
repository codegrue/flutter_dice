import 'package:flutter/material.dart';
import 'package:flutter_dice/blocs/state_bloc.dart';
import 'package:flutter_dice/pages/dice_page.dart';
import 'package:flutter_dice/providers/state_provider.dart';
import 'package:flutter_dice/services/state_persist.dart';

void main() => runApp(StatefulWrapper());

class StatefulWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateProvider(
      child: ThemeableApp(),
    );
  }
}

class ThemeableApp extends StatefulWidget {
  final String appName = 'Flutter Dice';

  @override
  ThemeableAppState createState() {
    return ThemeableAppState();
  }
}

class ThemeableAppState extends State<ThemeableApp> {
  ThemeType themeTypeName;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    final persistState = PersistState();
    themeTypeName = await persistState.loadThemeType();
  }

  @override
  Widget build(BuildContext context) {
    var stateBloc = StateProvider.of(context);
    return StreamBuilder(
      initialData: stateBloc.themeTypeToData(themeTypeName),
      stream: stateBloc.theme,
      builder: (content, snapshot) {
        ThemeData theme = snapshot.data;
        return MaterialApp(
          title: widget.appName,
          theme: theme,
          home: DicePage(title: widget.appName),
        );
      },
    );
  }
}
