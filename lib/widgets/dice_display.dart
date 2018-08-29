import 'package:flutter/material.dart';
import 'package:flutter_dice/widgets/bound_text.dart';
import 'package:flutter_dice/providers/dice_provider.dart';

class DiceDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final diceBloc = DiceProvider.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BoundText(diceBloc.roll, style: TextStyle(fontSize: 200.0)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("- [", style: TextStyle(fontSize: 20.0)),
              BoundText(diceBloc.sides,
                  style: TextStyle(
                      fontSize: 20.0, color: Theme.of(context).accentColor)),
              Text(" sided] -", style: TextStyle(fontSize: 20.0)),
            ],
          ),
        ],
      ),
    );
  }
}
