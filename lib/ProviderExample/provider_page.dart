import 'package:flutter/material.dart';
import 'package:flutter_dice/widgets/action_buttons.dart';
import 'package:flutter_dice/widgets/dice_display.dart';
import 'package:flutter_dice/widgets/dice_buttons.dart';
import 'package:provider/provider.dart';

import 'provider_model.dart';

class ProviderPage extends StatelessWidget {
  ProviderPage(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    final dice = Provider.of<ProviderModel>(context);

    return WillPopScope(
      onWillPop: () => dice.saveState(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Stack(
            children: <Widget>[
              DiceDisplay(
                roll: dice.roll,
                sides: dice.sides,
              ),
              DiceButtons(
                onDicePressed: dice.changeSides,
                selectedSides: dice.sides,
              ),
              ActionButtons(
                onDecrementPressed: () => dice.decrementDice(),
                onIncrementPressed: () => dice.incrementDice(),
                onRollPressed: () => dice.rollDice(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
