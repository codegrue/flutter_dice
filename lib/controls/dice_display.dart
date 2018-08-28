import 'package:flutter/material.dart';
import 'package:flutter_dice/controls/bound_text.dart';
import 'package:flutter_dice/providers/state_provider.dart';

class DiceDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stateBloc = StateProvider.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BoundText(stateBloc.roll, style: TextStyle(fontSize: 200.0)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("- [", style: TextStyle(fontSize: 20.0)),
              BoundText(stateBloc.sides,
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
