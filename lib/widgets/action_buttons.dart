import 'package:flutter/material.dart';
import 'package:flutter_dice/widgets/themed_image.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    Key? key,
    this.onIncrementPressed,
    this.onDecrementPressed,
    this.onRollPressed,
  });

  final VoidCallback? onIncrementPressed;
  final VoidCallback? onDecrementPressed;
  final VoidCallback? onRollPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            onPressed: onDecrementPressed,
            tooltip: 'Decrement',
            heroTag: 'Decrement',
            child: Icon(Icons.arrow_downward),
          ),
          FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            onPressed: onRollPressed,
            tooltip: 'Roll',
            heroTag: 'Roll',
            child: ThemedImage('rolling'),
          ),
          FloatingActionButton(
            onPressed: onIncrementPressed,
            tooltip: 'Increment',
            heroTag: 'Increment',
            child: Icon(Icons.arrow_upward),
          ),
        ],
      ),
    );
  }
}
