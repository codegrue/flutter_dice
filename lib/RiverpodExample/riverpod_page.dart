import 'package:flutter/material.dart';
import 'package:flutter_dice/widgets/action_buttons.dart';
import 'package:flutter_dice/widgets/dice_display.dart';
import 'package:flutter_dice/widgets/dice_buttons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'riverpod_main.dart';

class RiverpodPage extends ConsumerWidget {
  RiverpodPage(this.title);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dice = ref.watch(riverpodProvider);
    final diceNotifier = ref.read(riverpodProvider.notifier);

    return Scaffold(
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
              onDicePressed: diceNotifier.changeSides,
              selectedSides: dice.sides,
            ),
            ActionButtons(
              onDecrementPressed: () => diceNotifier.decrementDice(),
              onIncrementPressed: () => diceNotifier.incrementDice(),
              onRollPressed: () => diceNotifier.rollDice(),
            ),
          ],
        ),
      ),
    );
  }
}
