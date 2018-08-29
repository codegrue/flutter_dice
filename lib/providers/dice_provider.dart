import 'package:flutter/material.dart';
import 'package:flutter_dice/blocs/dice_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiceProvider extends InheritedWidget {
  DiceProvider({Key key, Widget child, SharedPreferences prefs})
      : diceBloc = DiceBloc(prefs),
        super(key: key, child: child);

  final DiceBloc diceBloc;

  @override
  bool updateShouldNotify(DiceProvider oldWidget) =>
      (oldWidget.diceBloc != diceBloc);

  static DiceBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(DiceProvider) as DiceProvider)
        .diceBloc;
  }
}
