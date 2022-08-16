import 'package:flutter/material.dart';
import 'package:flutter_dice/ProviderExample/models/dice_model.dart';
import 'package:provider/provider.dart';

class DiceDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dice = Provider.of<DiceModel>(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(dice.roll.toString(), style: TextStyle(fontSize: 200.0)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("- ", style: TextStyle(fontSize: 20.0)),
              Text(dice.sides.toString(),
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).colorScheme.secondary)),
              Text(" sided -", style: TextStyle(fontSize: 20.0)),
            ],
          ),
        ],
      ),
    );
  }
}
