import 'package:flutter/material.dart';
import 'package:flutter_dice/controls/themed_image.dart';
import 'package:flutter_dice/providers/state_provider.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stateBloc = StateProvider.of(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => stateBloc.decrementDice(),
            tooltip: 'Decrement',
            child: Icon(Icons.arrow_downward),
          ),
          FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            onPressed: () => stateBloc.rollDice(),
            tooltip: 'Roll',
            child: ThemedImage('rolling'),
          ),
          FloatingActionButton(
            onPressed: () => stateBloc.incrementDice(),
            tooltip: 'Increment',
            child: Icon(Icons.arrow_upward),
          ),
        ],
      ),
    );
  }
}
