import 'package:flutter/material.dart';
import 'package:flutter_dice/blocs/dice_bloc.dart';

class DiceProvider extends InheritedWidget {
  DiceProvider({Key key, Widget child}) : super(key: key, child: child);

  final DiceBloc diceBloc = DiceBloc();

  @override
  bool updateShouldNotify(DiceProvider oldWidget) =>
      (oldWidget.diceBloc != diceBloc);

  static DiceBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(DiceProvider) as DiceProvider)
        .diceBloc;
  }
}
