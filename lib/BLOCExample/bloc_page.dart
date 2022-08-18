import 'package:flutter/material.dart';
import 'package:flutter_dice/widgets/action_buttons.dart';
import 'package:flutter_dice/widgets/dice_display.dart';
import 'package:flutter_dice/widgets/dice_buttons.dart';
import 'package:flutter_dice/BLOCExample/bloc_model.dart';

class BlocPage extends StatelessWidget {
  BlocPage(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    final stateBloc = BlocProvider.of(context);

    return WillPopScope(
      onWillPop: () => stateBloc.saveState(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        // streambuilder to respond to changes in 'sides' values
        body: StreamBuilder(
          stream: stateBloc.sides,
          builder: (context, AsyncSnapshot<int> snapshot) {
            int sides = snapshot.data ?? 0;
            return Container(
              padding: EdgeInsets.all(20.0),
              child: Stack(
                children: <Widget>[
                  // streambuilder to respond to changes in 'roll' values
                  StreamBuilder(
                    stream: stateBloc.roll,
                    builder: (context, AsyncSnapshot<int> snapshot) {
                      int roll = snapshot.data ?? 0;
                      return DiceDisplay(
                        roll: roll,
                        sides: sides,
                      );
                    },
                  ),
                  DiceButtons(
                    onDicePressed: stateBloc.changeSides,
                    selectedSides: sides,
                  ),
                  ActionButtons(
                    onDecrementPressed: () => stateBloc.decrementDice(),
                    onIncrementPressed: () => stateBloc.incrementDice(),
                    onRollPressed: () => stateBloc.rollDice(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
