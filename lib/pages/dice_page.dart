import 'package:flutter/material.dart';
import 'package:flutter_dice/widgets/action_buttons.dart';
import 'package:flutter_dice/widgets/dice_display.dart';
import 'package:flutter_dice/widgets/sides_buttons.dart';
import 'package:flutter_dice/widgets/theme_icon_button.dart';
import 'package:flutter_dice/providers/dice_provider.dart';

class DicePage extends StatelessWidget {
  DicePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return DiceProvider(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            ThemeIconButton(),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Stack(
            children: <Widget>[
              DiceDisplay(),
              SidesButtons(),
              ActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
