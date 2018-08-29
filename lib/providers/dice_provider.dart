import 'package:flutter/material.dart';
import 'package:flutter_dice/blocs/dice_bloc.dart';

class DiceProvider extends InheritedWidget {
  DiceProvider({Key key, Widget child}) : super(key: key, child: child);

  final diceBloc = DiceBloc();

  @override
  bool updateShouldNotify(_) => true;

  static DiceBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(DiceProvider) as DiceProvider)
        .diceBloc;
  }
}
