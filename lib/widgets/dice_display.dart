import 'package:flutter/material.dart';

class DiceDisplay extends StatelessWidget {
  const DiceDisplay({
    Key? key,
    required this.roll,
    required this.sides,
  });

  final int roll;
  final int sides;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(roll.toString(), style: TextStyle(fontSize: 200.0)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("- ", style: TextStyle(fontSize: 20.0)),
              Text(sides.toString(),
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
