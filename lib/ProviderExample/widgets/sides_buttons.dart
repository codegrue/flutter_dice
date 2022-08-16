import 'package:flutter/material.dart';
import 'package:flutter_dice/ProviderExample/models/dice_model.dart';
import 'package:flutter_dice/ProviderExample/widgets/themed_image.dart';
import 'package:provider/provider.dart';

class SidesButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dice = Provider.of<DiceModel>(context);

    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildFacesButton(4, dice),
          _buildFacesButton(6, dice),
          _buildFacesButton(8, dice),
          _buildFacesButton(12, dice),
          _buildFacesButton(20, dice),
        ],
      ),
    );
  }

  FloatingActionButton _buildFacesButton(
    int desiredSides,
    DiceModel dice,
  ) {
    return FloatingActionButton(
      backgroundColor: (dice.sides == desiredSides) ? Colors.orange : null,
      onPressed: () => dice.changeSides(desiredSides),
      child: ThemedImage('d$desiredSides'),
    );
  }
}
