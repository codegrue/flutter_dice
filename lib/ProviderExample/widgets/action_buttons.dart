import 'package:flutter/material.dart';
import 'package:flutter_dice/ProviderExample/models/dice_model.dart';
import 'package:flutter_dice/ProviderExample/widgets/themed_image.dart';
import 'package:provider/provider.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dice = Provider.of<DiceModel>(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => dice.decrementDice(),
            tooltip: 'Decrement',
            child: Icon(Icons.arrow_downward),
          ),
          FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            onPressed: () => dice.rollDice(),
            tooltip: 'Roll',
            child: ThemedImage('rolling'),
          ),
          FloatingActionButton(
            onPressed: () => dice.incrementDice(),
            tooltip: 'Increment',
            child: Icon(Icons.arrow_upward),
          ),
        ],
      ),
    );
  }
}
