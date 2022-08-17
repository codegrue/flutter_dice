import 'package:flutter/material.dart';
import 'package:flutter_dice/widgets/themed_image.dart';

class DiceButtons extends StatelessWidget {
  const DiceButtons({
    Key? key,
    required this.selectedSides,
    required this.onDicePressed,
  });

  final int selectedSides;
  final Function(int) onDicePressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildFacesButton(4, selectedSides),
          _buildFacesButton(6, selectedSides),
          _buildFacesButton(8, selectedSides),
          _buildFacesButton(12, selectedSides),
          _buildFacesButton(20, selectedSides),
        ],
      ),
    );
  }

  FloatingActionButton _buildFacesButton(
    int desiredSides,
    int selectedSides,
  ) {
    return FloatingActionButton(
      backgroundColor: (selectedSides == desiredSides) ? Colors.orange : null,
      onPressed: () => onDicePressed(desiredSides),
      child: ThemedImage('d$desiredSides'),
      heroTag: desiredSides,
    );
  }
}
